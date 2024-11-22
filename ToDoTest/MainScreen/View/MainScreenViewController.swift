//
//  MainScreenViewController.swift
//  ToDoTest
//
//  Created by Артур  Арсланов on 22.11.2024.
//

import UIKit

protocol MainScreenViewInputProtocol: AnyObject {
    func displayTodos(_ todos: [ToDoData])
    func displayError(_ message: String)
}

protocol MainScreenViewOutputProtocol: AnyObject {
    init(view: MainScreenViewInputProtocol)
    func fetchTodos()
}

final class MainScreenViewController: UIViewController {
    var presenter: MainScreenViewOutputProtocol!
    
    private let tableView = UITableView()
    private var toDoData: [ToDoData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchTodos()
        view.backgroundColor = .black
        setupNavigationBar()
        setupTableView()
        
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainScreenTableViewCell.self, forCellReuseIdentifier: MainScreenTableViewCell.indentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .gray
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Задачи"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .orange
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .orange
        }
    }
}

//MARK: - MainScreenViewInputProtocol
extension MainScreenViewController: MainScreenViewInputProtocol {
    func displayTodos(_ todos: [ToDoData]) {
        toDoData = todos
        print("Tasks: \(toDoData.count)")
        tableView.reloadData()
    }
    
    func displayError(_ message: String) {
        print("Error \(message)")
    }
}

//MARK: - UITableViewDataSource
extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableViewCell.indentifier, for: indexPath) as? MainScreenTableViewCell else { return UITableViewCell()
        }
        let todo = toDoData[indexPath.row]
        cell.configure(with: todo)
        cell.delegate = self
        return cell
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoData[indexPath.row]
        print(toDo)
    }
}

extension MainScreenViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        //        viewModel.searchQuery = searchText
    }
}

extension MainScreenViewController: MainScreenTableViewCellDelegate {
    func didTapCompliteButton(isCompleted: Bool) {
        print("didTapCompliteButton")
    }
    
}

