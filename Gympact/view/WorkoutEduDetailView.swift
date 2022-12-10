//
//  WorkoutEduDetailView.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-27.
//

import AVKit
import SwiftUI

struct WorkoutEduDetailView: View {
    
    let selectedBookIndex : Int
    @State private var workoutName : String = ""
    @EnvironmentObject var workoutDBController : WorkoutDBController
    
    
    var body: some View {
        VStack{
            Divider()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            //Note: When adding the video links to database make sure to get the embed link
            VideoView(URL: workoutDBController.workoutList[selectedBookIndex].url)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            Divider()
            
            VStack(){
                
                Text("Muscle Groups")
                    .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
                    .bold()
                    .padding(.bottom)
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(workoutDBController.workoutList[selectedBookIndex].muscleGroups, id: \.self){ tag in
                            Text(tag)
                                .frame(width: 75 , height: 35)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10.0)
                                
                        }
                        .frame(width: 75, alignment: .leading)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            }
            
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            
            Text("Exercise Description")
                .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
                .bold()
                .padding(.bottom)
            Text(workoutDBController.workoutList[selectedBookIndex].description)
                .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
            Spacer()
        }
        .navigationTitle(workoutName)
        .navigationBarTitleDisplayMode(.large)
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
