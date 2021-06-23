//
//  UserService.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 22/06/21.
//

import Firebase

struct UserService {
    
    static let shared = UserService()
        
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        DB.USERS_REF.child(uid).observeSingleEvent(of: .value) { dataSnapshot in
            guard let userDictionary = dataSnapshot.value as? [String : AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: userDictionary)
        }
    }
}
