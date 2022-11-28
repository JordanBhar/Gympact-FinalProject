//
//  GympactApp.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-21.
//

import Firebase
import FirebaseFirestore
import SwiftUI

@main
struct GympactApp: App {
    
    let fireDBHelper = FireDBHelper()
    
    init() {
        FirebaseApp.configure()
//        fireDBHelper = FireDBHelper(database: Firestore.firestore())
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(fireDBHelper)
        }
    }
}
