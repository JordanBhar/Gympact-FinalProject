//
//  User.swift
//  FinalProject
//
//  Created by Muaz on 2022-11-24.
//

import Foundation

class User: Identifiable{
    
    var gender: String = ""
    var age: Int = 0
    var feet: Int = 0
    var inches: Int = 0
    
    
    init(gender: String, age: Int, feet: Int, inches: Int){
        self.inches = inches
        self.age = age;
        self.feet = feet
        self.gender = gender
    }
    
}


