//
//  PersonaModel.swift
//  TaskApp-Test
//
//  Created by Luis on 5/9/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import Foundation

//===========================================================================================
public class TaskDisplayObject : NSObject {
    //Se hereda de la clase NSObject para que nuestro TaskModel se comporte como un apuntador
    
    //Variables o propiedades todas de tipo var ya que cambiaran constantemente
    var intId: Int?
    var strName : String?
    var intPercentage: Int?
    
    //Constructor que inicializa la clase
    init(
        name : String,
        percentage: Int
        )
    {
        self.strName = name
        self.intPercentage = percentage
    }
    
    override init()
    {
        //Contructor vacio, se usa la palabra reservada override
    }
}
//==========================================================================================
