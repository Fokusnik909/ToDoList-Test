//
//  MainScreenInteractor.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import Foundation

protocol MainScreenInteractorInputProtocol: AnyObject {
    init(presenter: MainScreenInteractorOutputProtocol)
    func fetchTasks()
}

protocol MainScreenInteractorOutputProtocol: AnyObject {
    func didFetchTasks(_ tasks: [ToDoData])
}

final class MainScreenInteractor: MainScreenInteractorInputProtocol {
    weak var presenter: MainScreenInteractorOutputProtocol?
    
    init(presenter: MainScreenInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchTasks() {
//        presenter?.didFetchTasks(<#T##tasks: [ToDoData]##[ToDoData]#>)
    }
}
