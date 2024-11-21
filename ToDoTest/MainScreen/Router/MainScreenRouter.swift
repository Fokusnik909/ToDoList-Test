//
//  MainScreenRouter.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import Foundation

protocol MainScreenRouterInputProtocol: AnyObject {
    func navigateToTodoDetails(from view: MainScreenViewInputProtocol, with todo: ToDoData)
}

final class MainScreenRouter: MainScreenRouterInputProtocol {
    static func createModule() -> MainScreenViewController {
        let view = MainScreenViewController()
        let presenter = MainScreenPresenter(view: view)
        let interactor = MainScreenInteractor(presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
    
    func navigateToTodoDetails(from view: MainScreenViewInputProtocol, with todo: ToDoData) {
        
    }
}
