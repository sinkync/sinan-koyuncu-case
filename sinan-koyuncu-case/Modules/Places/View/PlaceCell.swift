//
//  PlaceCell.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    static let reuseIdentifier = "PlaceCell"
    
    // MARK: - Components
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ place: Place) {
        nameLabel.text = place.name
    }
}

// MARK: - UI

private extension PlaceCell {
    
    func setupUI() {
        contentView.addSubview(nameLabel)
        
        activateConstraints()
    }
    
    func activateConstraints() {
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16.0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0).isActive = true
    }
}
