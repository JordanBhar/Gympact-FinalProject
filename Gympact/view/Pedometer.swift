//
//  Pedometer.swift
//  Gympact
//
//  Created by Nichoalas Cammisuli on 2022-11-28.
//

import SwiftUI
import CoreMotion

struct Pedometer: View {
    
    let activityManager = CMMotionActivityManager()
    let pedometer = CMPedometer()
    
    @State private var steps : Int = 0
    @State private var activityState : String = "Unknown"
    @State private var activityImage : Image = Image(systemName: "figure.stand")
    
    var body: some View {
        
        VStack{
            
//            Spacer()
            
            HStack{
                VStack{
                    
                    self.activityImage
                        .resizable()
                        .frame(width: 40, height: 65, alignment: .center)
                        .foregroundColor(.blue)
                        .padding(.top, 100)
                        
                    Text("\(self.activityState)")
//                        .padding(.bottom, 10)
                }//vstack
            }//hstack
            
            HStack{
                //            Text("PEDOMETER!")
                Text("\(self.steps)")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                VStack{
                    Text("steps")
                        .padding(.top, 20)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }//vstack
            }//hstack
//            .padding(.bottom, 100)
            Spacer()
            
            Button(action: {
                self.steps = 0
            }){
                Text("Reset Steps")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .frame(width: 300, height: 100)
            .background(Color.blue)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))
            
            Spacer()
        }//vstack
        .navigationBarTitle("Pedometer", displayMode: .automatic)
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

struct Pedometer_Previews: PreviewProvider {
    static var previews: some View {
        Pedometer()
    }
}
