//
//  MainScreenPresenter.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import Foundation

struct ToDoData {
    let todo: String
    let description: String
    let isCompleted: Bool
}

final class MainScreenPresenter: MainScreenViewOutputProtocol {
    unowned let view: MainScreenViewInputProtocol
    var interactor: MainScreenInteractorInputProtocol!
    
    init(view: MainScreenViewInputProtocol) {
        self.view = view
    }
    
    func fetchTodos() {
        interactor.fetchTasks()
    }
    
}

//MARK: - MainScreenInteractorOutputProtocol
extension MainScreenPresenter: MainScreenInteractorOutputProtocol {
    func didFetchTasks(_ tasks: [ToDoData]) {
        view.displayTodos(tasks)
    }
    
    
}
