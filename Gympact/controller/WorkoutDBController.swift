//
//  WorkoutController.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-21.
//

import Foundation
import FirebaseFirestore

class WorkoutDBController : ObservableObject{
    
    @Published var WorkoutList = [Workout]()
    
    private let store : Firestore

    
    //singleton design pattern
    private static var shared : WorkoutDBController?
    
    init(database : Firestore){
        self.store = database
    }
    
    static func getInstance() -> WorkoutDBController{
        if (shared == nil){
            shared = WorkoutDBController(database: Firestore.firestore())
        }
        
        return shared!
    }    
}
