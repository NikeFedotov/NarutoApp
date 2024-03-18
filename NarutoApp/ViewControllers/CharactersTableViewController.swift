//
//  CharactersTableViewController.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import UIKit
import Alamofire

final class CharactersTableViewController: UITableViewController {
    
    //MARK: Private properties
    private var naruto: [Character] = []
    private let networkManager = NetworkManager.shared
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredCharacter: [Character] = []
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = .black
        
        setupNavigationBar()
        setupSearchController()
        fetchNaruto()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = isFiltering
        ? filteredCharacter[indexPath.row]
        : naruto[indexPath.row]
        guard let detailsVC = segue.destination as? DetailsCharacterViewController else { return }
        detailsVC.character = character
    }
}

// MARK: - Private methods
extension CharactersTableViewController {
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.font = UIFont.boldSystemFont(ofSize: 17)
            textField.textColor = .white
        }
    }
    
    private func setupNavigationBar() {
        title = "Naruto"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func fetchNaruto() {
        networkManager.fetchNaruto(from: NarutoAPI.baseURL.url) { result in
            switch result {
            case .success(let characters):
                self.naruto = characters
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension CharactersTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredCharacter.count : naruto.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? TableViewCell else { return UITableViewCell() }
        let character = isFiltering
        ? filteredCharacter[indexPath.row]
        : naruto[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}

// MARK: - UISearchResultsUpdating
extension CharactersTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredCharacter = naruto.filter { character in
            character.name.lowercased().contains(searchText.lowercased())
        } 
        
        tableView.reloadData()
    }
}
