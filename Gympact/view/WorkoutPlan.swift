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
    
    @State var item = ["Biceps", "Triceps"]
    @State var isExpanded = false
    

    var body: some View {
        
        VStack{
            
            List {
                DisclosureGroup(
                    content: {
                        ForEach(item, id: \.self){ item in
                            Text("\(item)")
                        }
                    },
                    label: {Text("Monday")})
                
                DisclosureGroup(
                    content: {
                        Text("Tuesday")
                        
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
            
        }
        
    }
    

}


struct WorkoutPlan_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlan()
    }
}
