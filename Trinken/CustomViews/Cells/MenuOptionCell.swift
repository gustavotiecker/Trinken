//
//  MenuOptionCell.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 18/06/21.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    static let reuseID = "MenuOptionCell"
    
    let iconImageView = UIImageView()
    let label = TitleLabel(textAlignment: .left, fontSize: 18)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(icon: UIImage, text: String) {
        iconImageView.image = icon
        label.text = text
    }

    private func configure() {
        addSubviews(iconImageView, label)
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding * 2),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
