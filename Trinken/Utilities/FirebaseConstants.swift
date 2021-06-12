//
//  FirebaseConstants.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 11/06/21.
//

import Foundation
import Firebase

enum DB {
    static let REF = Database.database().reference()
    static let USERS_REF = DB.REF.child("users")
}
