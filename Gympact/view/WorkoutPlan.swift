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
    
    @State private var queryResults: [String: Any]?

    
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
                       
                    },
                    label: {Text("Monday")})
                
                DisclosureGroup(
                    
                    content: {
                        
                        
                    },
                    label: {Text("Tuesday")})
                
                DisclosureGroup(
                    content: {
                        Text("Wednesday")
                        
                    },
                    label: {Text("Wednesday")})
                
                DisclosureGroup(
                    content: {
                        Text("Thursday")
                        
                    },
                    label: {Text("Thursday")})
                
                DisclosureGroup(
                    content: {
                        Text("Friday")
                        
                    },
                    label: {Text("Friday")})
            }
            
        }.onAppear(){
            checkResult()
        }
    
        
    }
    
    func checkResult(){
        
        
        let db = Firestore.firestore()

        
        db.collection("Workouts").document("Back & Biceps").collection("Exercises").getDocuments { (snapshot, error) in
            if let snapshot = snapshot {
    
                let documents = snapshot.documents
                
                db.collection("UserData").whereField("Gender", isEqualTo: "Male")
               
                let filteredDocuments = documents.filter { document in
                    return !["BackRow"].contains(document.documentID)
                }

                for document in filteredDocuments {
                    let data = document.data()
                    self.queryResults = data
                    print(self.queryResults!["name"] ?? "")
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
