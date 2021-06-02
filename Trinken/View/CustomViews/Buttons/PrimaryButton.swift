//
//  PrimaryButton.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 01/06/21.
//

import UIKit

class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 20
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Inter-Bold", size: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
