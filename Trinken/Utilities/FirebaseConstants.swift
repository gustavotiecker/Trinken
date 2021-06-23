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
    
    static let STORAGE_REF = Storage.storage().reference()
    static let STORAGE_PROFILE_IMAGES_REF = DB.STORAGE_REF.child("profile_images")
}
