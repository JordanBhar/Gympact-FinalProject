//
//  CalculatorView.swift
//  Gympact
//
//  Created by Nichoalas Cammisuli on 2022-12-10.
//

import SwiftUI

struct CalculatorView: View {
    var BarbellWeight = ["45", "33", "22", "10"]//weights of barbell
    @State private var selectedBarbell = "45" //default selected value
    
    var PlateOptions = ["8", "6", "4", "2", "0"]//weights of barbell
    @State private var selectedPlate50 = "0" //default selected value
    @State private var selectedPlate45 = "0" //default selected value
    @State private var selectedPlate35 = "0" //default selected value
    @State private var selectedPlate25 = "0" //default selected value
    @State private var selectedPlate10 = "0" //default selected value
    @State private var selectedPlate5 = "0" //default selected value
    @State private var selectedPlate2half = "0" //default selected value
    
    @State private var totalWeight = 0
    @State private var totalWeightKG = 0.0
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            HStack{
                Text("Barbell Weight(lbs):")
                    .font(.title)
                Picker("Barbell Weight", selection: $selectedBarbell) {
                    ForEach(BarbellWeight, id: \.self) {
                        Text($0)
                    }
                }//picker
            }//hstack
            
            Section("Weight Plates:", content: {
                VStack{
                    
                    HStack{
                        
                        HStack{
                            Image(systemName: "50.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Picker("Number of plates", selection: $selectedPlate50) {
                                ForEach(PlateOptions, id: \.self) {
                                    Text($0)
                                }
                            }//picker
                        }//hstack
                        
                        HStack{
                            Image(systemName: "45.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Picker("Number of plates", selection: $selectedPlate45) {
                                ForEach(PlateOptions, id: \.self) {
                                    Text($0)
                                }
                            }//picker
                        }//hstack
                        
                    }//Hstack
                    
                    HStack{
                        
                        HStack{
                            Image(systemName: "35.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Picker("Number of plates", selection: $selectedPlate35) {
                                ForEach(PlateOptions, id: \.self) {
                                    Text($0)
                                }
                            }//picker
                        }//hstack
                        
                        HStack{
                            Image(systemName: "25.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Picker("Number of plates", selection: $selectedPlate25) {
                                ForEach(PlateOptions, id: \.self) {
                                    Text($0)
                                }
                            }//picker
                        }//hstack
                        
                    }//Hstack
                    
                    HStack{
                        
                        HStack{
                            Image(systemName: "10.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Picker("Number of plates", selection: $selectedPlate10) {
                                ForEach(PlateOptions, id: \.self) {
                                    Text($0)
                                }
                            }//picker
                        }//hstack
                        
                        HStack{
                            Image(systemName: "5.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Picker("Number of plates", selection: $selectedPlate5) {
                                ForEach(PlateOptions, id: \.self) {
                                    Text($0)
                                }
                            }//picker
                        }//hstack
                        
                    }//Hstack
                    
//                    HStack{
//                        Image(systemName: "2.circle.fill")
//                            .resizable()
//                            .frame(width: 50, height: 50, alignment: .center)
//                            .foregroundColor(.blue)
//                        Picker("Number of plates", selection: $selectedPlate2half) {
//                            ForEach(PlateOptions, id: \.self) {
//                                Text($0)
//                            }
//                        }//picker
//                    }//hstack
                    
                }//vstack
            })//section
            .font(.title)
            
            
            Text("\(self.totalWeight)lbs")
                .font(.system(size: 30))
                .padding(.top, 100)
            
            Text("\(self.totalWeightKG, specifier: "%.0f")kgs")
                .font(.system(size: 20))
                .padding(.bottom, 100)
            
            
            Button(action: {
                self.calculateWeight()
            }){
                Text("Calculate Weight")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }//button

            .frame(width: 250, height: 80)
            .background(Color.blue)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))
                        

            
            Spacer()
            
        }//vstack
        .navigationBarTitle("Calculator", displayMode: .automatic)
    }//body
    
    func calculateWeight(){
        let selectedPlate50Int = Int(selectedPlate50) ?? 0
        let selectedPlate45Int = Int(selectedPlate45) ?? 0
        let selectedPlate35Int = Int(selectedPlate35) ?? 0
        let selectedPlate25Int = Int(selectedPlate25) ?? 0
        let selectedPlate10Int = Int(selectedPlate10) ?? 0
        let selectedPlate5Int = Int(selectedPlate5) ?? 0
        
        let selectedBarbellInt = Int(selectedBarbell) ?? 0
        
        
//        let selectedPlate2halfInt = Int(selectedPlate2half) ?? 0
        totalWeight = (selectedPlate50Int * 50) + (selectedPlate45Int * 45) + (selectedPlate35Int * 35) + (selectedPlate25Int * 25) + (selectedPlate10Int * 10) + (selectedPlate5Int * 5) + selectedBarbellInt
        
        totalWeightKG = round(Double(totalWeight)/2.2)
        
//        + (selectedPlate2halfInt * 2.5)
    }
    
}//view

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
