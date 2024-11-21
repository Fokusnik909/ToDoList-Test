//
//  EntityToDo.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import Foundation

struct TodosResponse: Decodable {
    let todos: [Todo]
}

struct Todo: Decodable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
