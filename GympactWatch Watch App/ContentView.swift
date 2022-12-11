//
//  ContentView.swift
//  GympactWatch Watch App
//
//  Created by Nichoalas Cammisuli on 2022-11-28.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    let activityManager = CMMotionActivityManager()
    let pedometer = CMPedometer()
    
    @State private var steps : Int = 0
    @State private var activityState : String = "Unknown"
    @State private var activityImage : Image = Image(systemName: "figure.stand")
    
    var body: some View {
        VStack{
            HStack{

                self.activityImage
                    .resizable()
                    .frame(width: 15, height: 30, alignment: .center)
                    .foregroundColor(.white)
               
                VStack{
                    Text("\(self.steps)")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    Text("steps")
                        .foregroundColor(.white)
                }//vstack
                
                
                
            }//hstack
            .padding(.bottom, 10)
            
            Button(action: {
                self.steps = 0
            }){
                Text("Reset Steps")
                    .foregroundColor(Color.white)
                    .font(.system(size: 15))
            }
                        .frame(width: 125, height: 33)
            .background(Color.blue)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))
            
        }//vstack
        .onAppear(){
            self.startActivityUpdates()
            self.startUpdates()
        }//on appear
        
    }//body
    
    
    func startActivityUpdates(){
           activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
               guard let activity = activity else { return }
               DispatchQueue.main.async {
                   if activity.stationary {
                       print("Stationary")
                       activityImage = Image(systemName: "figure.stand")
                       activityState = "Stationary"
                   } else if activity.walking {
                       print("Walking")
                       activityImage = Image(systemName: "figure.walk")
                       activityState = "Walking"
                   } else if activity.running {
                       print("Running")
                       activityImage = Image(systemName: "figure.run")
                       activityState = "Running"
                   } else if activity.automotive {
                       print("Automotive")
                       activityImage = Image(systemName: "car")
                       activityState = "Automotive"
                   }
               }
           }
       }
   
       func startUpdates(){
           if CMPedometer.isStepCountingAvailable() {
               pedometer.startUpdates(from: Date()) { pedometerData, error in
                   guard let pedometerData = pedometerData, error == nil else { return }
                
                   DispatchQueue.main.async {
                       print(pedometerData.numberOfSteps.intValue)
                       steps = pedometerData.numberOfSteps.intValue
//                       return pedometerData.numberOfSteps.intValue
                   }
               }
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
