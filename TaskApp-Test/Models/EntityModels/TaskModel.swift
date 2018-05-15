//
//  PersonaModel.swift
//  TaskApp-Test
//
//  Created by Luis on 5/9/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import Foundation

//===========================================================================================
public class TaskModel : NSObject {
    
    //                                          Propiedades
    var intId: Int?
    var strName : String?
    var strDescription : String?
    var intPercentage: Int?
    var done: Bool?
    
    //                                          Constructores
    init(name : String, description : String, percentage: Int, done: Bool)
    {
        self.strName = name
        self.strDescription = description
        self.intPercentage = percentage
        self.done = done
    }
    
    override init()
    {
        
    }
    
    func toString() -> String
    {
        return "Title: "  + self.strName! + ", Description: " + self.strDescription!
    }
}

