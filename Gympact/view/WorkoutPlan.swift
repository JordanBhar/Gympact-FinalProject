//
//  WorkoutPlan.swift
//  Gympact
//
//  Created by Nichoalas Cammisuli on 2022-11-28.
//

import SwiftUI

struct Bookmark: Identifiable {

    
    let id = UUID()
    let name: String
    var items: [Bookmark]?
    

    static let back_Monday = Bookmark(name: "Back & Biceps")
   
    static let monday = Bookmark(name: "Monday", items: [Bookmark.back_Monday])
    static let tuesday = Bookmark(name: "Tuesday", items: [])
    static let wednesday = Bookmark(name: "Wednesday",  items: [])
    static let thursday = Bookmark(name: "Thursday",  items: [])
    static let friday = Bookmark(name: "Friday",  items: [])
}


struct WorkoutPlan: View {
    
    let items: [Bookmark] = [.monday, .tuesday, .wednesday, .thursday, .friday]


    
    var body: some View {
        
        VStack{
            
            Text("Workout Plan")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.top, 40)
            
            List(items, children: \.items) { row in
                HStack {
                    Text(row.name)
                        .font(.title2)
                }
            }
        }
    }
    

}

struct WorkoutPlan_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlan()
    }
}
