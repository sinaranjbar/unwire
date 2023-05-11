//
//  SearchViewController.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation
import UIKit
import Combine

class SearchViewController: UIViewController, ViewControllerFactory {
    typealias Dependencies = MusicNetworkService
    
    weak var coordinator: AppCoordinator?
    
    static var storyboard: UIStoryboard = .main
    
    var dependencies: MusicNetworkService!
    var networkProvider: NetworkProvider!
    var viewModel: SearchViewModel?
    
    private var cancellables = Set<AnyCancellable>()
    private var dispatchWorkItem: DispatchWorkItem?
    
    private (set) var tableViewDataSource: TableViewDataSource<MusicCell>!
    
    private lazy var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.showsCancelButton = false
        search.searchBar.placeholder = "Search"
        search.searchBar.sizeToFit()
        return search
    }()
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(musicNetworkService: dependencies)
        setupUI()
        setupDataSource()
    }
    
    func loadData(_ term: String){
        viewModel?.searchItem(term: term)
        
        viewModel?.$datasource.sink(receiveValue: { musics in
            self.tableViewDataSource.refreshWithNewItems(musics)
        })
        .store(in: &cancellables)
    }
    
    private func setupDataSource(){
        tableViewDataSource = TableViewDataSource(cellHeight: 100, items: [], tableView: tableView)
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
    }
    
    private func setupUI() {
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.searchBar.delegate = self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dispatchWorkItem?.cancel()
        
        guard !searchText.isEmpty, searchText.count > 1 else {
            return
        }
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.view.endEditing(true)
            self?.loadData(searchText)
        }
        
        self.dispatchWorkItem = requestWorkItem
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: requestWorkItem)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadData(searchBar.text ?? "")
    }
}
