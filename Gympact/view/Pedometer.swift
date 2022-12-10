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
    
    var body: some View {
        
        VStack{
            Text("PEDOMETER!")
            Text("\(self.steps)")
            Text("\(self.activityState)")
        }
        .onAppear(){
            self.startActivityUpdates()
            self.startUpdates()
        }
        
    }
    
    
    func startActivityUpdates(){
           activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
               guard let activity = activity else { return }
               DispatchQueue.main.async {
                   if activity.stationary {
                       print("Stationary")
                       activityState = "Stationary"
                   } else if activity.walking {
                       print("Walking")
                       activityState = "Walking"
                   } else if activity.running {
                       print("Running")
                       activityState = "Running"
                   } else if activity.automotive {
                       print("Automotive")
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
