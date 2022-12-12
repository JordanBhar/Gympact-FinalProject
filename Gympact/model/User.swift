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
    var weight: Float = 0.0
    var goal_weight: Bool = false
    var goal_muscle: Bool = false
    
    
    init(gender: String, age: Int, feet: Int, inches: Int, weight: Float, goal_weight: Bool, goal_muscle: Bool){
        self.inches = inches
        self.age = age;
        self.feet = feet
        self.gender = gender
        self.weight = weight
        self.goal_weight = goal_weight
        self.goal_muscle = goal_muscle
    }
    
}


