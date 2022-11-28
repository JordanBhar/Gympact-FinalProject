//
//  WorkoutEduListView.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-27.
//

import SwiftUI

struct WorkoutEduListView: View {
    @EnvironmentObject var workoutDBController : WorkoutDBController
    @State private var selectedIndex : Int = -1
    
    var selectedGroup : String
    
    var body: some View {
        VStack{
            List{
                ForEach(self.workoutDBController.workoutList.enumerated().map({$0}), id: \.element.self){index, workout in

                    NavigationLink(destination: WorkoutEduDetailView(selectedBookIndex: index).environmentObject(workoutDBController)){
                    
                        VStack(alignment: .leading){
                            Text("\(workout.name)")
                                .fontWeight(.bold)
                        }//VStack
                        .onTapGesture {
                            self.selectedIndex = index
                            print(#function, "selected book index : \(self.selectedIndex) \(workout)")

                        }//VStack
                    }//NavigationLink

                }//ForEach
            }//List ends
        }
        .navigationTitle(selectedGroup)
        .navigationBarTitleDisplayMode(.large)
        .onAppear{
            if(self.workoutDBController.workoutList != nil){
                self.workoutDBController.getCategoryWorkouts(category: selectedGroup)
                print("CONTENT TEST PLEASE :\(self.workoutDBController.workoutList)")
            }
            
        }
    }
}

struct WorkoutEduListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEduListView(selectedGroup: "NA")
    }
}
