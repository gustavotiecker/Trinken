//
//  BodyLabel.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 03/06/21.
//

import UIKit

class BodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont(name: "Inter-Medium", size: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        font = UIFont(name: "Inter-Medium", size: 16)
        textColor = UIColor(named: "secondary-text-color")
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
