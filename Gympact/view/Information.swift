//
//  Information.swift
//  FinalProject
//
//  Created by Muaz on 2022-11-24.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct Information: View {
    
    @EnvironmentObject var fireDBHelper : FireDBHelper
    
    @State public var selectedGender: String = "Male"
    
    @State public var selectionAge : Int = 18
    @State public var selectionWeight : Int = 100
    @State public var selectionFeet : Int = 1
    @State public var selectionInches : Int = 1
    
    
    public let gender: [String] = [
    "Male",
    "Female"
    
    ]
    
    var body: some View {
        
        VStack(spacing: 30){
            
            
            
            Text("Enter Information")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.bottom, 10)
                
            
            VStack(spacing: 10){
               
                    
                    Text("Select Gender")
                    .underline()
                        .padding([.leading, .bottom])
                    Picker("Gender", selection: $selectedGender){
                        
                        ForEach(gender, id: \.self){
                            gender in Text(gender)
                        }
                    }
                    
  
                    .pickerStyle(.segmented)
                
            }
            
            VStack(spacing: 10){
                
                HStack{
                   
                    Text("Select Weight")
                        .underline()
                       
                    
                    Text("Select Age")
                        .underline()
                        .padding(.leading, 70)
                }

                HStack{

                    Picker(selection: $selectionWeight,
                           label: Text("Picker"),
                           content: {
                        ForEach(0..<400){number in
                            Text("\(number)")
                                .tag("\(number)")
                        }
                        
                        
                        
                    })
                    
                    .pickerStyle(.inline)
                    
                    
                    HStack{

                        Picker(selection: $selectionAge,
                               label: Text("Picker"),
                               content: {
                            ForEach(0..<100){number in
                                Text("\(number)")
                                    .tag("\(number)")
                            }
                            
                            
                            
                        })
                        
                        .pickerStyle(.inline)
                    }
                }
                
        
            }
            
            VStack(spacing: 10){
                
                Text("Select Height")
                    .underline()
                
                    .padding([.leading, .bottom])
                
                HStack{
                    Text("Feet")
                    
                    Text("Inches")
                        .padding(.leading, 100)
                }
                
                
                
                HStack{
                   
                    Picker(selection: $selectionFeet,
                           label: Text("Picker"),
                           content: {
                        ForEach(0..<8){number in
                            Text("\(number)")
                                .tag("\(number)")
                        }
                        
                    })
                    
                    .pickerStyle(.inline)
                    
                    Picker(selection: $selectionInches,
                           label: Text("Picker"),
                           content: {
                        ForEach(0..<12){number in
                            Text("\(number)")
                                .tag("\(number)")
                        }
                        
                    })
                    
                    .pickerStyle(.inline)
                    
                }
                
                Button(action: {
                    
                    fireDBHelper.setUserData(userData: User.init(gender: selectedGender, age: selectionAge, feet: selectionFeet, inches: selectionInches, weight: Float(selectionWeight)))
                    
                  
                }){
                    Text("NEXT")
                        .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 16, fontColor: Color.white))
                    
                        .frame(maxWidth: .infinity)
                        .frame(height: 56, alignment: .leading)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            
            
            
            Spacer()
            
            
        }
        .padding(.horizontal,30)
        .padding(.vertical, 25)
        
    }
}

struct Information_Previews: PreviewProvider {
    static var previews: some View {
        Information()
    }
}
