//
//  User.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 22/06/21.
//

import Foundation

struct User {
    var fullname: String?
    var email: String?
    var profileImageUrl: URL?
    var uid: String?
    
    init() {}
    
    init(uid: String, dictionary: [String : AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String
        self.email = dictionary["email"] as? String
        
        if let profileImageUrlString = dictionary ["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}
