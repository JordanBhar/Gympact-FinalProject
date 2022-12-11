//
//  ContentView.swift
//  FinalProject
//
//  Created by Nicholas on 2022-11-14.
//

import SwiftUI
import MapKit

struct Homepage: View {
    
    let locationController = LocationController()
    
    @State private var selection: Int? = nil
    @State private var userRegion = MKCoordinateRegion()
    @State private var showingSheet = false
    
    var body: some View{
        NavigationLink(destination: WorkoutEduCatView(), tag: 1, selection: self.$selection){}
        NavigationLink(destination: CalculatorView(), tag: 2, selection: self.$selection){}
        NavigationLink(destination: Pedometer(), tag: 3, selection: self.$selection){}
        NavigationLink(destination: WorkoutPlan(), tag: 4, selection: self.$selection){}
        NavigationLink(destination: SettingsView(), tag: 5, selection: self.$selection){}
        
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    
                    Divider()
                    
                    ZStack{
    
                        Map(coordinateRegion: self.$userRegion, showsUserLocation: true, annotationItems: locationController.routePins , annotationContent: { location in
                            MapMarker(coordinate: location.coordinate)
                        })
                            .frame(width: 400, height: 300)
                        
                        VStack{
                            HStack{
                                Spacer()
                                Button(action:{
                                    showingSheet.toggle()
                                    
                                    
                                }){
                                    Image(systemName: "mappin")
                                        .frame(width: 35, height: 35)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(.blue, lineWidth: 3)
                                        )

                                }
                                .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 25))
                                .sheet(isPresented: $showingSheet){
                                    SheetView().environmentObject(locationController)
                                }
                            }
                            
                            HStack{
                                Spacer()
                                Button(action:{
                                    self.locationController.routePins.removeAll()
                                }){
                                    Image(systemName: "trash")
                                        .frame(width: 35, height: 35)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(.blue, lineWidth: 3)
                                        )

                                }
                                .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 25))
                            }
                            
                            HStack{
                                Spacer()
                                Button(action:{
                                    self.locationController.routePins.removeLast()
                                }){
                                    Image(systemName: "arrow.uturn.backward")
                                        .frame(width: 35, height: 35)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(.blue, lineWidth: 3)
                                        )

                                }
                                .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 25))
                            }
                            Spacer()
                        }
                    }
                
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
                                print("Calendar button was tapped")
                            } label: {
                                VStack{
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .foregroundColor(Color.blue)
                                    Text("Calendar")
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
                                    Image(systemName: "plus.circle")
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
                        
                        
                    }//Hstack App Features
                    
                }//vstack
                .onChange(of: locationController.currentLocation) {  newLocation in
                    if(locationController.currentLocation != nil){
                        self.userRegion = locationController.currentRegion!
                    }
                }
                .onAppear(){
                    if(locationController.currentLocation != nil){
                        self.userRegion = locationController.currentRegion!
                    }
                }
                .navigationBarTitle("Homepage", displayMode: .automatic)
            }//ZStack
        }//nav view
        .navigationBarBackButtonHidden(true)
    }//body
}//view


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var locationController : LocationController
    
    @State private var tfStreet : String = ""
    @State private var tfCity : String = ""
    @State private var tfCountry : String = ""
    @State private var result : String = ""
    
    var body: some View {
        
        VStack{
            Text("Add Pin")
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            Form{
                TextField("Enter Street", text: $tfStreet)
                    .padding()
                
                TextField("Enter City", text: $tfCity)
                    .padding()
                   
                TextField("Enter City", text: $tfCountry)
                    .padding()
                    
            }//Form
            Button(action: {
                let address = "\(self.tfStreet), \(self.tfCity), \(self.tfCountry)"
                self.locationController.doForwardGeocoding(address: address)
                dismiss()
            }){
                Text("Submit")
                    .foregroundColor(Color.white)
                    
            }
            .frame(width: 200, height: 100)
            .background(Color.blue)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))
            
            
            Button(action:{
                dismiss()
            }){
                Text("Cancel")
                    .foregroundColor(Color.white)
            }
            .frame(width: 200, height: 100)
            .background(Color.blue)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))

            Spacer()
        }//VStack
    }
}


struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
