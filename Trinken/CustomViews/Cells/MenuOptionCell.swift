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
    let title = TitleLabel(textAlignment: .left, fontSize: 18)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(menuOption: MenuOptions?) {
        iconImageView.image = menuOption?.icon
        title.text = menuOption?.title
    }

    private func configure() {
        addSubviews(iconImageView, title)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        accessoryType = .none
        selectionStyle = .none
        iconImageView.tintColor = Colors.MAIN_TEXT_COLOR
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            title.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
