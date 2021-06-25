//
//  UserManager.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 23/06/21.
//

import Foundation

final class UserManager {
    
    private var user: User
    
    var currentUser: User {
        get { return user }
        set { user = newValue }
    }
    
    private init() {
        user = User()
    }
    
    static let shared = UserManager()
}
