//
//  FavoritesVC.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit

class FavoritesVC: BaseVC {
    
    private var viewModel: FavoritesVM!
    
    // MARK: - Components
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PlaceCell.self, forCellReuseIdentifier: PlaceCell.reuseIdentifier)
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigator = FavoritesNavigator(navigationController: navigationController)
        viewModel = FavoritesVM(navigator: navigator)
        setupUI()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadFavorites()
    }
}

// MARK: - UI

private extension FavoritesVC {
    
    func bind() {
        viewModel.refreshing = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupUI() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        view.addSubview(tableView)
        
        activateConstraints()
    }
    
    func activateConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor).isActive = true
    }
}


// MARK: - UITableViewDatasource, UITableViewDelegate

extension FavoritesVC: UITableViewDataSource, UITableViewDelegate {
    
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
            viewModel.showPlaceDetail(place)
        }
    }
}

// MARK: - Actions

extension FavoritesVC {
    
    @objc private func closeButtonTapped() {
        viewModel.close()
    }
}
