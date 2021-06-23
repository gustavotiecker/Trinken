//
//  User.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 22/06/21.
//

import Foundation

struct User {
    var fullname: String
    var email: String
    var profileImageUrl: String
    var uid: String
    
    init(uid: String, dictionary: [String : AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
