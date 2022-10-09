//
//  PlaceDetailVC.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit

class PlaceDetailVC: BaseVC {
    
    private var viewModel: PlaceDetailVM!
    
    var place: Place?
    
    // MARK: - Components
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28.0, weight: .medium)
        
        return label
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.setImage(UIImage(named: "favorite"), for: .normal)
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigator = PlaceDetailNavigator(navigationController: navigationController)
        viewModel = PlaceDetailVM(navigator: navigator)
        viewModel.place = place
        setupUI()
        bind()
        configure()
    }
    
    func configure() {
        nameLabel.text = place?.name
        rateLabel.text = place?.rating?.toString() ?? "0.0"
        addressLabel.text = place?.vicinity
    }
}

// MARK: - UI

private extension PlaceDetailVC {
    
    func bind() {
        viewModel.favoriteStatusChanged = { [weak self] status in
            let icon = status ? UIImage(named: "favorite-filled") : UIImage(named: "favorite")
            self?.favoriteButton.setImage(icon, for: .normal)
        }
        
        viewModel.checkFavoriteStatus()
    }
    
    func setupUI() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        view.addSubview(nameLabel)
        view.addSubview(rateLabel)
        view.addSubview(addressLabel)
        view.addSubview(favoriteButton)
        
        activateConstraints()
    }
    
    func activateConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        nameLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 16.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -16.0).isActive = true
        
        rateLabel.centerYAnchor.constraint(equalTo: addressLabel.centerYAnchor).isActive = true
        rateLabel.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 16.0).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16.0).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: rateLabel.rightAnchor, constant: 16.0).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -16.0).isActive = true
        
        favoriteButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        favoriteButton.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -24.0).isActive = true
        favoriteButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -24.0).isActive = true
    }
}

// MARK: - Actions

extension PlaceDetailVC {
    
    @objc private func closeButtonTapped() {
        viewModel.close()
    }
    
    @objc private func favoriteButtonTapped() {
        viewModel.toogleFavoriteStatus()
    }
}
