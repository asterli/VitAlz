//
//  WelcomeView.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/17/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct WelcomeView: View {
    @StateObject var viewModel: ToDoListViewModel
    @State private var selectedDate = Date()
    @FirestoreQuery var items: [ToDoListItem]
    let notify = NotificationHandler()
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userID: userId))
    }
    var body: some View {
        
        
        NavigationView{
            VStack{
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id:item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            
                Button("Request Permission"){
                    notify.askPermission()
                }
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    //label
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
                Button{
                    //label
                    viewModel.showingMewItemView = true
                } label: {
                    Text("Add Medicine Intake")
                }
                
            }
            .sheet(isPresented:$viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
            .sheet(isPresented:$viewModel.showingMewItemView) {
                MedicineView(mewItemPresented: $viewModel.showingMewItemView)
            }
        }
        
       
    }
}

struct ToDoListItemsView_Previews: PreviewProvider{
    static var previews: some View{
        WelcomeView(userId: "7ioVLxPac1dej439dbu956gV8Xm1")
    }
}
