//
//  BasicTextField.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 03/06/21.
//

import UIKit

class BasicTextField: UITextField {
    
    let iconImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String, icon: UIImage) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        self.iconImageView.image = icon
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureIcon()
        
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }
    
    private func configureIcon() {
        let contentView = UIView()
        contentView.addSubview(iconImageView)
        contentView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        
        iconImageView.frame = CGRect(x: 10, y: 0, width: 25, height: 20)
        iconImageView.tintColor = UIColor.systemGray4
        
        leftView = contentView
        leftViewMode = .always
    }
}
