//
//  PlacesVC.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit
import CoreLocation

class PlacesVC: BaseVC {
    
    private var viewModel: PlacesVM!
    
    // MARK: - Components
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PlaceCell.self, forCellReuseIdentifier: PlaceCell.reuseIdentifier)
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    private lazy var favoritesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.setImage(UIImage(named: "favorite-filled"), for: .normal)
        button.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigator = PlacesNavigator(navigationController: navigationController)
        viewModel = PlacesVM(navigator: navigator)
        setupUI()
        setupSearchController()
        bind()
    }
}

// MARK: - UI

private extension PlacesVC {
    
    func bind() {
        viewModel.refreshing = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.requestLocation()
    }
    
    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(favoritesButton)
        
        activateConstraints()
    }
    
    func activateConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor).isActive = true
        
        favoritesButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        favoritesButton.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        favoritesButton.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -24.0).isActive = true
        favoritesButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -24.0).isActive = true
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Places"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - UITableViewDatasource, UITableViewDelegate

extension PlacesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCell.reuseIdentifier, for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        
        if let place = viewModel.place(at: indexPath) {
            cell.configure(place)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPlaces
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let place = viewModel.place(at: indexPath) {
            viewModel.openMap(place)
        }
    }
}

// MARK: - UISearchResultsUpdating

extension PlacesVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text ?? ""
        viewModel.searchPlaces(query)
    }
}

// MARK: - Actions

extension PlacesVC {
    
    @objc private func favoritesButtonTapped() {
        viewModel.openFavorites()
    }
}
