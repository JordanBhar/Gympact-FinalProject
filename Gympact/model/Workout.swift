//
//  Workout.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-11-21.
//

import Foundation
import FirebaseFirestoreSwift

struct Workout : Codable , Hashable{
   
    @DocumentID var id : String? = UUID().uuidString
    var name : String = ""
    var muscleGroups : [String] = []
    var description : String = ""
    var url : String? = ""
    
    init(name: String, muscleGroups : [String], description: String, url: String){
        self.name = name
        self.muscleGroups = muscleGroups
        self.description = description
        self.url = url
        
    }
    
    init(){
        
    }
    
    //Failable initializer
    init?(dictionary: [String: Any]){
        
        guard let name = dictionary["name"] as? String else{
            return nil
        }
        
        guard let muscleGroups = dictionary["muscleGroups"] as? [String] else{
            return nil
        }
        
        guard let description = dictionary["muscleGroups"] as? String else{
            return nil
        }
        
        guard let url = dictionary["muscleGroups"] as? String else{
            return nil
        }
        
        self.init(name: name, muscleGroups: muscleGroups, description: description, url: url )
        
    }

    
}

