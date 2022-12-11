//
//  ContentView.swift
//  FinalProject
//
//  Created by Nicholas on 2022-11-14.
//

import SwiftUI

struct Homepage: View {
    @State private var selection: Int? = nil
    
    var body: some View {
        NavigationLink(destination: WorkoutEduCatView(), tag: 1, selection: self.$selection){}
        NavigationLink(destination: CalculatorView(), tag: 2, selection: self.$selection){}
        NavigationLink(destination: Pedometer(), tag: 3, selection: self.$selection){}
        NavigationLink(destination: WorkoutPlan(), tag: 4, selection: self.$selection){}
        NavigationLink(destination: SettingsView(), tag: 5, selection: self.$selection){}
        
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
                .background(Color.blue.clipShape(RoundedRectangle(cornerRadius:35)))
                
                HStack{
                    VStack{
                        Button {
                            print("Workout Education button was tapped")
                            self.selection = 1
                        } label: {
                            VStack{
                                Image(systemName: "dumbbell")
                                    .resizable()
                                    .frame(width: 150, height: 120, alignment: .center)
                                    .foregroundColor(Color.blue)
                                Text("Workout Education")
                            }//vstack
                            .padding(10)
                        }//button
                        
                        Button {
                            self.selection = 2
                            print("Calculator button was tapped")
                        } label: {
                            VStack{
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(Color.blue)
                                Text("Calculator")
                            }//vstack
                            .padding(10)
                        }//button
                    }//vstack
                    
                    
                    VStack{
                        Button {
                            print("Workout Plan button was tapped")
                            self.selection = 4
                        } label: {
                            VStack{
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(Color.blue)
                                Text("Workout Plan")
                            }//vstack
                            .padding(10)
                        }//button
                        
                        Button {
                            print("Pedometer button was tapped")
                            self.selection = 3
                        } label: {
                            VStack{
                                Image(systemName: "shoeprints.fill")
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(Color.blue)
                                Text("Pedometer")
                            }//vstack
                            .padding(10)
                        }//button
                    }//vstack
                    
                    
                }//Hstack
                
                //            .padding()
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        
                        Button(action: {
                            self.selection = 5
                        }, label: {
                            Image(systemName: "gearshape")
                        })

                    }
                    
                }//toolbar
            }//vstack
            
            .navigationBarTitle("Homepage", displayMode: .automatic)
        }//nav view
        .navigationBarBackButtonHidden(true)
    }//body
}//view

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
