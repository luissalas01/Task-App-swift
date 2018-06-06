//
//  PersonaModel.swift
//  TaskApp-Test
//
//  Created by Luis on 5/9/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import Foundation

//===========================================================================================
public class TaskModel: NSObject {
    //Se hereda de la clase NSObject para que nuestro TaskModel se comporte como un apuntador
    
    //Variables o propiedades todas de tipo var ya que cambiaran constantemente
    var intId: Int?
    var strName : String?
    var strDescription : String?
    var intPercentage: Int?
    var boolDone: Bool?
    
    //Constructor que inicializa la clase
    init(
        id: Int,
        name : String,
        description : String,
        percentage: Int,
        done: Bool
        )
    {
        self.intId = id
        self.strName = name
        self.strDescription = description
        self.intPercentage = percentage
        self.boolDone = done
    }
    
    //Constructor que inicializa la clase
    init(
        name : String,
        description : String,
        percentage: Int,
        done: Bool
        )
    {
        self.strName = name
        self.strDescription = description
        self.intPercentage = percentage
        self.boolDone = done
    }
    
    override init()
    {
        //Contructor vacio, se usa la palabra reservada override
    }
    
    
    override public var description: String
    {
        //Se crea una sobrecarga del metodo description para dar una descripción adecuada de
        //      nuestro objeto.
        
        return "Title: "  + self.strName! + ", Description: " + self.strDescription!
    }
}
//==========================================================================================
