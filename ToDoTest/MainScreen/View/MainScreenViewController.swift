//
//  MainScreenViewController.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import UIKit

protocol MainScreenViewInputProtocol: AnyObject {
    func displayTodos(_ todos: [ToDoData])
}

protocol MainScreenViewOutputProtocol: AnyObject {
    init(view: MainScreenViewInputProtocol)
}

final class MainScreenViewController: UIViewController {
    var presenter: MainScreenViewOutputProtocol!
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self

    }
}

//MARK: - MainScreenViewInputProtocol
extension MainScreenViewController: MainScreenViewInputProtocol {
    func displayTodos(_ todos: [ToDoData]) {
        
    }
}

//MARK: - UITableViewDataSource
extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

