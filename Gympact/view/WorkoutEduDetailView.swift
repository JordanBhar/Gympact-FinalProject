//
//  WorkoutEduDetailView.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-27.
//

import SwiftUI

struct WorkoutEduDetailView: View {
    
    let selectedBookIndex : Int
    
    @State private var workoutName : String = ""
    @EnvironmentObject var workoutDBController : WorkoutDBController
    
    var body: some View {
        VStack{
            
        }
        .navigationTitle(workoutName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            self.workoutName = workoutDBController.workoutList[selectedBookIndex].name
        }
    }
}

struct WorkoutEduDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEduDetailView(selectedBookIndex: 0)
    }
}
