//
//  ToDoListViewModel.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/17/24.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject{
    @Published var showingNewItemView = false
    @Published var showingMewItemView = false
    
    private let userId: String
    
    init(userID: String) {
        self.userId = userID
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
