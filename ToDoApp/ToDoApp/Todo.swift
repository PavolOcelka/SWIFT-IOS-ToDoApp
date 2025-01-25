//
//  Todo.swift
//  ToDoApp
//
//  Created by Pavol Ocelka on 25/01/2025.
//

import Foundation

struct Todo: Identifiable{
    let id: UUID = UUID()
    var text: String
    var type: String
}
