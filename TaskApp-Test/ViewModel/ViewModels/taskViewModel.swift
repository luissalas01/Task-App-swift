//
//  taskViewModel.swift
//  TaskApp-Test
//
//  Created by Towa Software on 29/05/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import UIKit

class taskViewModel: TaskModel  {
    
    //Constructor que inicializa la clase
    init(
        task: TaskModel
        )
    {
        super.init(
                   id: task.intId!,
                   name: task.strName!,
                   description: task.strDescription!,
                   percentage: task.intPercentage!,
                   done: task.boolDone!
        )
    }
    
    override init()
    {
        super.init()
    }
    
    public func AddTask(name: String, description: String, percentage: Int, done: Bool){
        //Se crea una nueva tarea con los valores de los campos en el view controller
        let newTask: TaskModel = TaskModel(name: name,
                                           description: description,
                                           percentage: percentage,
                                           done: done)
        
        //Se guarda el nuevo task
        TaskDAO.AddTask(task: newTask)
        
        //Se actualizan los valores de nuestras propiedades
        self.intId = newTask.intId
        self.strName = newTask.strName
        self.strDescription = newTask.strDescription
        self.intPercentage = newTask.intPercentage
        self.boolDone = newTask.boolDone
    }
    
    public func EditTask(name: String, description: String, percentage: Int, done: Bool)
    {
        //Se pasan los valores recibidos de los controles a task
        self.strName = name
        self.strDescription = description
        self.intPercentage = percentage
        self.boolDone = done
        
        //Guardar cambios del task editado
        TaskDAO.EditTask(task: (self as TaskModel))
    }
    
    public func DeleteTask()
    {
        //Elimina la tarea
        TaskDAO.DeleteTask(task: self)
    }
}
