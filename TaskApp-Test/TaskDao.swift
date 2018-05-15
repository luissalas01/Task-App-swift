//
//  TaskDao.swift
//  TaskApp-Test
//
//  Created by Luis on 5/10/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import Foundation

public class TaskDAO
{
    //Definición de variables estaticas
    public static var listTasks: Array<TaskModel> = []
    public static var intIndex: Int = 1
    
    //Agregar una nueva tarea
    public static func AddTask(task: TaskModel)
    {
        let intId: Int = TaskDAO.intIndex
        task.intId = intId
        TaskDAO.listTasks.append(task)
        TaskDAO.intIndex = TaskDAO.intIndex + 1
    }
    
    //Editar una tarea existente
    public static func EditTask(task: TaskModel)
    {
        //Extraer la posicion donde se encuentra nuestra tarea
        let intIndex: Int = TaskDAO.listTasks.index(of: task)!
        TaskDAO.listTasks[intIndex] = task
    }
    
    //Borrar una tarea existente
    public static func DeleteTask(task: TaskModel)
    {
        //Se obtiene el index de la tarea a eliminar
        let intIndex = TaskDAO.listTasks.index(of: task)
        
        //Eliminar la tarea 
        TaskDAO.listTasks.remove(at: intIndex! )
    }
}
