//
//  MenuOptions.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 21/06/21.
//

import UIKit

enum MenuOptions {
    
    case termsAndConditions
    case feedback
    case about
    
    var title: String {
        switch self {
        case .termsAndConditions:
            return "Terms and Conditions"
        case .feedback:
            return "Feedback"
        case .about:
            return "about"
        }
    }
        
    var icon: UIImage {
        switch self {
        case .termsAndConditions:
            return SFSymbols.TERMS
        case .feedback:
            return SFSymbols.FEEDBACK
        case .about:
            return SFSymbols.ABOUT
        }
    }
}
