//
//  AuthService.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 11/06/21.
//

import Foundation
import Firebase

struct AuthCredentials {
    let fullName: String
    let email: String
    let password: String
}

struct AuthService {
    static let shared = AuthService()
    
    var hasUserLoggedIn: Bool {
        if Auth.auth().currentUser == nil {
            return false
        } else {
            return true
        }
    }
    
    func registerUser(credentials: AuthCredentials, completion: @escaping (Error?, DatabaseReference) -> Void) {
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["fullname" : credentials.fullName,
                          "email" : credentials.email,
                          "password" : credentials.password]
            
            DB.USERS_REF.child(uid).updateChildValues(values, withCompletionBlock: completion)
        }
    }
}
