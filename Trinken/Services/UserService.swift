//
//  UserService.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 22/06/21.
//

import Firebase

struct UserService {
    
    static let shared = UserService()
    
    func getCurrentUserUid() -> String? {
        return Auth.auth().currentUser?.uid
    }
            
    func fetchUser(uid: String, completion: @escaping (User) -> Void) {
        DB.USERS_REF.child(uid).observeSingleEvent(of: .value) { dataSnapshot in
            guard let userDictionary = dataSnapshot.value as? [String : AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: userDictionary)
            completion(user)
        }
    }
    
    func updateProfileImage(image: UIImage, completion: @escaping (URL?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.3),
              let uid = Auth.auth().currentUser?.uid else { return }
        
        let fileName = NSUUID().uuidString
        let reference = DB.STORAGE_PROFILE_IMAGES_REF.child(fileName)
        
        reference.putData(imageData, metadata: nil) { storageMetadata, error in
            reference.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else { return }
                let profileImageDictionary = ["profileImageUrl" : profileImageUrl]
                
                DB.USERS_REF.child(uid).updateChildValues(profileImageDictionary) { error, dbReference in
                    completion(url)
                }
            }
        }
    }
}
