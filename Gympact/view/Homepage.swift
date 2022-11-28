//
//  ContentView.swift
//  FinalProject
//
//  Created by Nicholas on 2022-11-14.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack{
                        Text("Cardio")
                            .foregroundColor(Color.white)
                        HStack{
                            Button {
                                print("Runing button was tapped")
                            } label: {
                                VStack{
                                    Image(systemName: "figure.run")
                                        .resizable()
                                        .frame(width: 25, height: 35, alignment: .center)
                                        .foregroundColor(Color.white)
                                }//vstack
                                .padding(10)
                            }//button
                            
                            
                            Button {
                                print("Walking button was tapped")
                            } label: {
                                VStack{
                                    Image(systemName: "figure.walk")
                                        .resizable()
                                        .frame(width: 23, height: 35, alignment: .center)
                                        .foregroundColor(Color.white)
                                }//vstack
                                .padding(10)
                            }//button
                            
                            Button {
                                print("Biking button was tapped")
                            } label: {
                                VStack{
                                    Image(systemName: "figure.outdoor.cycle")
                                        .resizable()
                                        .frame(width: 35, height: 35, alignment: .center)
                                        .foregroundColor(Color.white)
                                }//vstack
                                .padding(10)
                            }//button
                            
                        }//hstack
                    }//vstack
                    
                }//hstack
                .frame(width: 350, height: 125, alignment: .center)
                .background(Color.indigo.clipShape(RoundedRectangle(cornerRadius:35)))
                
                HStack{
                    VStack{
                        Button {
                            print("Workout Education button was tapped")
                        } label: {
                            VStack{
                                Image(systemName: "dumbbell")
                                    .resizable()
                                    .frame(width: 150, height: 120, alignment: .center)
                                    .foregroundColor(Color.indigo)
                                Text("Workout Education")
                            }//vstack
                            .padding(10)
                        }//button
                        
                        Button {
                            print("Calendar button was tapped")
                        } label: {
                            VStack{
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(Color.indigo)
                                Text("Calendar")
                            }//vstack
                            .padding(10)
                        }//button
                    }//vstack
                    
                    
                    VStack{
                        Button {
                            print("Workout Plan button was tapped")
                        } label: {
                            VStack{
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(Color.indigo)
                                Text("Workout Plan")
                            }//vstack
                            .padding(10)
                        }//button
                        
                        Button {
                            print("Pedometer button was tapped")
                        } label: {
                            VStack{
                                Image(systemName: "shoeprints.fill")
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(Color.indigo)
                                Text("Pedometer")
                            }//vstack
                            .padding(10)
                        }//button
                    }//vstack
                    
                    
                }//Hstack
                
                //            .padding()
            }//vstack
            .navigationBarTitle("Homepage", displayMode: .automatic)
        }//nav view
    }//body
}//view

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
