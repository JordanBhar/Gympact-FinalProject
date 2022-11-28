//
//  WorkoutController.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-21.
//

import Foundation
import FirebaseFirestore

class WorkoutDBController : ObservableObject{
    
    @Published var workoutList = [Workout]()
    
    private let store : Firestore
    private let COLLECTION_Workouts : String = "Workouts"
    
    private let SUB_COLLECTION_EXERCISES : String = "Exercises"

    
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
    
    
    func getCategoryWorkouts(category : String){ //This method only stores one category of workouts one category at a time, dont use this method to get a list of all the workouts & categories
        
        self.workoutList.removeAll()
        
//        let loggedInUser : String = UserDefaults.standard.string(forKey: "KEY_EMAIL") ?? "NA"
        
        self.store
            .collection(COLLECTION_Workouts)
            .document(category)
            .collection(SUB_COLLECTION_EXERCISES)
            .order(by: "name", descending: true)
            .addSnapshotListener({ (querySnapshot, error)  in
                
                guard let snapshot = querySnapshot else{
                    print(#function, "Error while retrieving records \(error)")
                    return
                }
                
                snapshot.documentChanges.forEach{ (docChange) in
                    do{
                        var workout = Workout()
                        workout = try docChange.document.data(as: Workout.self)
                        
                        let docID = docChange.document.documentID
                        workout.id = docID
                        
                        let matchedIndex = self.workoutList.firstIndex(where: { ($0.id?.elementsEqual(docID))! })
                        
                        print("Matched Index: \(matchedIndex)")
                        
                        if docChange.type == .added{
                            self.workoutList.append(workout)
                            print(#function, "Document ADDED : \(workout)")
                            print("TEST \(self.workoutList)")
                        }
                        
                        if docChange.type == .modified{
                            //change or replace current object in bookList with updated values
                            
                            if(matchedIndex != nil){
                                self.workoutList[matchedIndex!] = workout
                            }
                        }

                        if docChange.type == .removed{
                            if(matchedIndex != nil){
                                self.workoutList.remove(at: matchedIndex!)
                            }
                        }
                    }catch let err as NSError{
                        print(#function, "unable to identify document change \(err)")
                    }
                }
                
            })
    }
    
    
    
}
