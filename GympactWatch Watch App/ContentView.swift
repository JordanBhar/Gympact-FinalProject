//
//  ContentView.swift
//  GympactWatch Watch App
//
//  Created by Nichoalas Cammisuli on 2022-11-28.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    //Provides to create an instance of the CMMotionActivityManager.
    private let activityManager = CMMotionActivityManager()
    // Provides to create an instance of the CMPedometer.
    private let pedometer = CMPedometer()
    
    
    
    var body: some View {
        VStack {
            
            
            Image(systemName: "shoeprints.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("10000 Steps!")
        }
        .padding()
    }
    
    
//    func startActivityUpdates(){
//        activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
//            guard let activity = activity else { return }
//            DispatchQueue.main.async {
//                if activity.stationary {
//                    print("Stationary")
//                } else if activity.walking {
//                    print("Walking")
//                } else if activity.running {
//                    print("Running")
//                } else if activity.automotive {
//                    print("Automotive")
//                }
//            }
//        }
//    }
//    
//    func startUpdates(){
//        if CMPedometer.isStepCountingAvailable() {
//            pedometer.startUpdates(from: Date()) { pedometerData, error in
//                guard let pedometerData = pedometerData, error == nil else { return }
//                
//                DispatchQueue.main.async {
//                    print(pedometerData.numberOfSteps.intValue)
//                }
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
