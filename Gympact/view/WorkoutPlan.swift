//
//  WorkoutPlan.swift
//  Gympact
//
//  Created by Nichoalas Cammisuli on 2022-11-28.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct WorkoutPlan: View {
    
    @State var isExpanded = false
    
    @State private var monday: [String: Any] = [:]
    @State private var tuesday: [String: Any] = [:]
    @State private var wednesday: [String: Any] = [:]
    @State private var thursday: [String: Any] = [:]
    
    var exercises_monday : [String] = ["HammerCurl", "DumbellRows", "CableRows"]
    var exercises_tuesday: [String] = ["BenchdDip", "Benchpress", "CableFlies", "DiamondPushup", "OverheadTricepExtension"]
    var exercises_wednesday: [String] = ["CableHipAbduction", "LegExtension"]
    var exercises_thursday: [String] = ["ArnoldPress", "PreacherCrunches", "BarbellOverheadPress", "DumbelLateralRaises"]
    
    var body: some View {
        
        VStack{
            
            Text("Workout Plan")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.top, 20)
            
            List {
                DisclosureGroup(
                    content: {
                        
                        Text(monday["name"] as? String ?? "" )
                        
                        ForEach(exercises_monday, id: \.self) { item in
                                        Text(item)
                                    }
   
                    },
                    label: {Text("Monday - Back & Biceps")})
                
                DisclosureGroup(
                    
                    content: {
                        
                        Text(tuesday["name"] as? String ?? "" )
                        
                        ForEach(exercises_tuesday, id: \.self) { item in
                                        Text(item)
                                    }
                    },
                    label: {Text("Tuesday - Chest & Triceps")})
                
                DisclosureGroup(
                    content: {
                       
                        Text(wednesday["name"] as? String ?? "" )
                        
                        ForEach(exercises_wednesday, id: \.self) { item in
                                        Text(item)
                                    }

                    },
                    label: {Text("Wedneday - Legs")})
                
                DisclosureGroup(
                    content: {
                       
                        Text(thursday["name"] as? String ?? "" )
                        
                        ForEach(exercises_thursday, id: \.self) { item in
                                        Text(item)
                                    }
                        
                    },
                    label: {Text("Thursday - Abs & Shoulders")})
                
            }
            
        }.onAppear(){
            monday_func()
            tuesday_func()
            wednesday_func()
            thursday_func()
        }
    
        
    }
    
    func monday_func(){
        
        
        let db = Firestore.firestore()
        
        db.collection("Workouts").document("Back & Biceps").collection("Exercises").getDocuments { (snapshot, error) in
            if let snapshot = snapshot {
    
                let documents = snapshot.documents
                
                let ref = Firestore.firestore().collection("UserData")
                
                ref.whereField("Weight", isGreaterThan: 100).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        // Handle error
                    } else {
                        if !querySnapshot!.isEmpty {
                            let filteredDocuments = documents.filter { document in
                                return !["LatPulldown", "DumbelCurl"].contains(document.documentID)
                            }

                            
                            
                            for document in filteredDocuments {
                                let data = document.data()
                                self.monday = data
                                //print(self.monday["name"] ?? "")
                            }
                        } else {
                            let filteredDocuments = documents.filter { document in
                                return !["BackRow", "MuscleUps"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.monday = data
                                //print(self.monday["name"] ?? "")
                            }
                        }
                    }
                }
               
               
            } else {
                print("Error getting documents: \(error!)")
            }
        }
        
    }
    
    
    func tuesday_func(){
        
        
        let db = Firestore.firestore()
        
        db.collection("Workouts").document("Chest & Triceps").collection("Exercises").getDocuments { (snapshot, error) in
            if let snapshot = snapshot {
    
                let documents = snapshot.documents
                
                let ref = Firestore.firestore().collection("UserData")
                
                ref.whereField("Gender", isEqualTo: "Male").getDocuments { (querySnapshot, error) in
                    if error != nil {
                        // Handle error
                    } else {
                        if !querySnapshot!.isEmpty {
                            
                            let filteredDocuments = documents.filter { document in
                                return !["PikePushup", "ExplosivePushup"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.tuesday = data
                                print(self.tuesday["name"] ?? "")
                            }
                        } else {
                            
                            let filteredDocuments = documents.filter { document in
                                return !["CableTricepExtentionSingle", "ParrallelDip"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.tuesday = data
                                print(self.tuesday["name"] ?? "")
                            }
                        }
                    }
                }
               
               
            } else {
                print("Error getting documents: \(error!)")
            }
        }
        
    }
    
    func wednesday_func(){
        
        
        let db = Firestore.firestore()
        
        db.collection("Workouts").document("Front legs").collection("Exercises").getDocuments { (snapshot, error) in
            if let snapshot = snapshot {
    
                let documents = snapshot.documents
                
                let ref = Firestore.firestore().collection("UserData")
                
                ref.whereField("Age", isGreaterThan: 15).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        // Handle error
                    } else {
                        if !querySnapshot!.isEmpty {
                            let filteredDocuments = documents.filter { document in
                                return !["WalkingLunges", "DumbelStepUp"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.wednesday = data
                                //print(self.wednesday["name"] ?? "")
                            }
                        } else {
                            let filteredDocuments = documents.filter { document in
                                return !["Squat", "LegPress"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.wednesday = data
                                //print(self.wednesday["name"] ?? "")
                            }
                        }
                    }
                }
               
               
            } else {
                print("Error getting documents: \(error!)")
            }
        }
        
    }
    
    func thursday_func(){
        
        
        let db = Firestore.firestore()
        
        db.collection("Workouts").document("Abs & Shoulders").collection("Exercises").getDocuments { (snapshot, error) in
            if let snapshot = snapshot {
    
                let documents = snapshot.documents
                
                let ref = Firestore.firestore().collection("UserData")
                
                ref.whereField("MuscleGoal", isEqualTo: true).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        // Handle error
                    } else {
                        if !querySnapshot!.isEmpty {
                            let filteredDocuments = documents.filter { document in
                                return !["ScapulaShrugs", "ArnoldPress"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.thursday = data
                                //print(self.thursday["name"] ?? "")
                            }
                        } else {
                            let filteredDocuments = documents.filter { document in
                                return !["LateralRaises", "PreacherCrunches"].contains(document.documentID)
                            }

                            for document in filteredDocuments {
                                let data = document.data()
                                self.thursday = data
                                //print(self.thursday["name"] ?? "")
                            }
                        }
                    }
                }
               
               
            } else {
                print("Error getting documents: \(error!)")
            }
        }
        
    }
    
    
    
    
    
    
}


struct WorkoutPlan_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlan()
    }
}
