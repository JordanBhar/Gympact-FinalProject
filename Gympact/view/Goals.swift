//
//  Goals.swift
//  FinalProject
//
//  Created by Muaz on 2022-11-28.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct Goals: View {
    
    @State var weightLoss: Bool = true
    @State var muscleBuild: Bool = true
    
    @State private var selection: Int? = nil
    
    @State public var selectionAge : Int = 18
    @State public var selectionWeight : Int = 100
    @State public var selectionFeet : Int = 1
    @State public var selectionInches : Int = 1
    @State public var selectedGender: String = "Male"
    
    @EnvironmentObject var fireDBHelper : FireDBHelper
    
    var info = Information()
    
    var body: some View {
        NavigationLink(destination: Homepage(), tag: 1, selection: self.$selection){}
        
        VStack(spacing: 10){
            
            
            Text("Choose Goals")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.bottom, 40)
            
            VStack {
                
                        Text("Weight Loss")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 10)
                            .foregroundColor(weightLoss ? .blue : .gray)
                
                Toggle(isOn: $weightLoss){
                    Image("weight")
                        .resizable()
                        .frame(width: 200, height: 150)
                        
                }
                            
                
            }.padding(.all, 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 2)
                            .foregroundColor(weightLoss ? .green : .red)
                    )
            
            VStack {
                        Text("Build Muscle")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 10)
                            .foregroundColor(muscleBuild ? .blue : .gray)
                
                Toggle( isOn: $muscleBuild){
                    Image("muscle")
                        .resizable()
                        .frame(width: 175, height: 175)
                }
                          
            }.padding(.all, 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .foregroundColor(muscleBuild ? .green : .red)
                    )
            
        
            Button(action: {
                
                fireDBHelper.setUserData(userData: User.init(gender: selectedGender, age: selectionAge, feet: selectionFeet, inches: selectionInches, weight: Float(selectionWeight), goal_weight: Bool(weightLoss), goal_muscle: Bool(muscleBuild)))
                
                self.selection = 1
              
            }){
                
                Text("NEXT")
                    .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 16, fontColor: Color.white))
                
                    .frame(maxWidth: .infinity)
                    .frame(height: 56, alignment: .leading)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 50)
            }
            
            
        }
        .padding(.horizontal,30)
        .padding(.vertical, 25)
    }
}

struct Goals_Previews: PreviewProvider {
    static var previews: some View {
        Goals()
    }
}
