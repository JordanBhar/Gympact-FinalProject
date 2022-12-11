//
//  Pin.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-12-10.
//

import Foundation
import CoreLocation

struct Pin : Identifiable{
    var id: UUID
    
    
    public var coordinate : CLLocationCoordinate2D

    init(lat: Double, long: Double) {
        self.id = UUID()
        self.coordinate = CLLocationCoordinate2D(latitude: lat , longitude: long)
    }
    
}
