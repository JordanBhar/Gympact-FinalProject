//
//  LocationController.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-12-10.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

class LocationController : NSObject , ObservableObject, CLLocationManagerDelegate{
    
    private let locationManager = CLLocationManager()
    private var lastKnownLocation : CLLocation?
    private let geocoder = CLGeocoder()
    
    @Published var currentLocation : CLLocation?
    @Published var currentRegion : MKCoordinateRegion?
    @Published var routePins = [Pin(lat: 0.0, long: 0.0)]
    
    override init (){
        super.init()
        
//      kCLLocationAccuracyBest, provides updates more frequently, for activities like driving rather than walking
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        
                case .authorizedWhenInUse:
                    //enable loction related features
                    manager.startUpdatingLocation()
                    break
        
                case .restricted, . denied:
                    //disable location features
                    break
                case .notDetermined:
                    manager.requestAlwaysAuthorization()
                    break
        
                default:
                    break
                }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        print(#function, "Location change is recived")
        
        if locations.last != nil{
            currentLocation = locations.last
            currentRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: currentLocation?.coordinate.latitude ?? 0.0, longitude: currentLocation?.coordinate.longitude ?? 0.0),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }else{
            //location.first - last known location
            // oldest / previous location
            lastKnownLocation = locations.first
        }
        
        lastKnownLocation = locations.first
        
        print(#function,"Current Location : \(currentLocation)")
        print(#function,"Last Location : \(lastKnownLocation)")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function, "Unable to recive location events : \(error.localizedDescription)")
    }
    

    func doForwardGeocoding(address: String){

        self.geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if (error != nil){
                print(#function,"Unable to perform forward geocoding :  \(error?.localizedDescription)")
            }else{
                if let placemark = placemarks?.first{

                    let obtainedLocation = placemark.location!
                    self.routePins.append(Pin(lat: obtainedLocation.coordinate.latitude, long: obtainedLocation.coordinate.longitude ))
                    print(#function, "Obtained location after forwarding geocoding : \(obtainedLocation)")

                }else{
                    print(#function, "unable to obtain placemark for forward geocoding")
                }
            }

        })
    }


}
