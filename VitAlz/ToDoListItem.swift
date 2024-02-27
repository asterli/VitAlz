//
//  ToDoListItem.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/18/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id: String
    let number: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
