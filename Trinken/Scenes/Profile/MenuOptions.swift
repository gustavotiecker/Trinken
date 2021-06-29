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
    case signOut
    
    var title: String {
        switch self {
        case .termsAndConditions:
            return "Terms and Conditions"
        case .feedback:
            return "Feedback"
        case .about:
            return "About"
        case .signOut:
            return "Sign Out"
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
        case .signOut:
            return SFSymbols.SIGN_OUT
        }
    }
}
