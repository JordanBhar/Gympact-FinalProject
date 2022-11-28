//
//  FireDBHelper.swift
//  Gympact
//
//  Created by Muaz on 2022-11-28.
//

import Foundation
import Firebase
import FirebaseAuth

class FireDBHelper: ObservableObject {
    
    init(){}
    
    
    func setUserData(userData: User){
        
        let db = Firestore.firestore()
        let data = db.collection("UserData").document(Auth.auth().currentUser!.uid)
        data.updateData(["Gender": userData.gender, "Age": userData.age, "Feet":userData.feet, "Inches": userData.inches, "Weight": userData.weight]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
}
