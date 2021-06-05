//
//  AttributedButton.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 04/06/21.
//

import UIKit

class AttributedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ firstPart: String, _ secondPart: String) {
        self.init(frame: .zero)
        let attributedTitle = NSMutableAttributedString(
            string: firstPart,
            attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular), NSAttributedString.Key.foregroundColor: Colors.mainTextColor as Any]
        )
        
        attributedTitle.append(
            NSAttributedString(
                string: secondPart,
                attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold), NSAttributedString.Key.foregroundColor: Colors.primaryColor as Any]
            )
        )
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.textAlignment = .center
    }
}
