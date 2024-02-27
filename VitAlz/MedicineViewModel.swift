//
//  NewItemViewViewModel.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/17/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class MedicineViewModel: ObservableObject{
    @Published var title = ""
    @Published var date = Date()
    @Published var number = ""
    @Published var showAlert = false
    
    init(){
        
    }
    
    func save(){
        guard canSave else{
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id:newID, number: number, title: title, dueDate: date.timeIntervalSince1970, createdDate:Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
