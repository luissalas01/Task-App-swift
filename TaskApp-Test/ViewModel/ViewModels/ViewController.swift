//
//  ViewController.swift
//  TaskApp-Test
//
//  Created by Luis on 5/8/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var task: TaskModel = TaskModel()
    private var boolEdit: Bool = false
    
    @IBOutlet weak var lblTask: UILabel!
    @IBOutlet weak var btnNew: UIButton!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextView!
    @IBOutlet weak var swchDone: UISwitch!
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var sldrPercentage: UISlider!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if (self.task.intId != nil)
        {
            self.boolEdit = true
            self.btnDelete.isHidden = false
            BindingControls()
        }
        else
        {
            self.boolEdit = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Acción del boton Save
    @IBAction func btnActionPresed(_ sender: UIButton)
    {
        if (
            //Si estamos en modo edición
            boolEdit
            )
        {
            //Se llama a la rutina para edición
            EditTask()
        }
        else
        {
            //Se llama a la rutina para insersión
            AddNewTask()
        }
    }
    
    //Acción del botón Delete
    @IBAction func btnDeleteActionPresed(_ sender: UIButton)
        
    {
        DeleteTask()
    }
    
    //Cuando el usuario cambia el estatus del switch
    @IBAction func swDoneAction(_ sender: UISwitch)
    {
        let intPercentage: Int
        if (
            //si se activa la tarea esta completada, de lo contrario es incompleta
            self.swchDone.isOn
            )
        {
            intPercentage = 100
        }
        else
        {
            intPercentage = 50
        }
        
        //Reflejar los cambios en slider y label de porcentaje
        self.sldrPercentage.setValue(Float(intPercentage), animated: true)
        self.lblPercentage.text = Int(self.sldrPercentage.value).description + "%"
        
    }
    
    @IBAction func sldrAction(_ sender: UISlider)
    {
        //Porcentaje actual de la tarea
        let intPercentage = Int(self.sldrPercentage.value)
        
        //reflejar cambio en el label
        self.lblPercentage.text = intPercentage.description + "%"
        
        if (
            //Si se completa la tarea deslizando el slider
            intPercentage == 100
            )
        {
            self.swchDone.setOn(true, animated: true)
        }
        else
        {
            self.swchDone.setOn(false, animated: true)
        }
    }
    
    private func AddNewTask()
    {
        //Se crea una nueva tarea con los valores de los campos en el view controller
        let newTask: TaskModel = TaskModel(name: self.tfTitle.text!,
                                           description: self.tfDescription.text!,
                                           percentage: Int(self.sldrPercentage.value),
                                           done: swchDone.isOn)
       //Se guarda el nuevo task
        TaskDAO.AddTask(task: newTask)
        
        //Crear objeto para mostrar alerta
        let alert = UIAlertController(title: "TaskApp", message: "The task: " + newTask.strName! + " was created", preferredStyle: UIAlertControllerStyle.alert)
        
        //Crear accion (boton con un evento o accion) de alerta
        let action  = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        {
            _ in alert.dismiss(animated: true, completion: nil)
            
            //Navegagion antigua
            /*let viewController = self.storyboard?.instantiateViewController(withIdentifier: "viewcontTasksList") as! viewcontTaskList
             
             self.present(viewController, animated: true, completion: nil)
             */
            self.navigationController?.popViewController(animated: true)
        }
        
        //Agregar accion a la alerta y mostrarla
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func EditTask()
    {
        //Se pasan los valores de los controles a task
        self.task.strName = self.tfTitle.text
        self.task.strDescription = self.tfDescription.text
        self.task.intPercentage = Int(self.sldrPercentage.value)
        //self.task.done = self.swchDone.isOn
        
        //Guardar cambios del task editado
        TaskDAO.EditTask(task: self.task)
        
        //Regresa al menú principal
        self.navigationController?.popViewController(animated: true)
    }
    
    private func DeleteTask()
    {
        //Elimina la tarea
        TaskDAO.DeleteTask(task: self.task)
        
        //Regresa a el menú principal
        self.navigationController?.popViewController(animated: true)
    }
    
    private func BindingControls()
    {
        self.tfTitle.text = self.task.strName
        self.tfDescription.text = self.task.strDescription
        self.sldrPercentage.value = Float(self.task.intPercentage!)
        self.lblPercentage.text = (self.task.intPercentage?.description)! + " %"
        if (
            self.task.intPercentage == 100
        )
        {
            self.swchDone.isOn = true
        }
        else
        {
            self.swchDone.isOn = false
        }
    }
    
    private func ClearControls()
    {
        self.tfTitle.text = ""
        self.tfDescription.text = ""
        self.sldrPercentage.value = 50.0
        self.lblPercentage.text = "50 %"
        self.swchDone.isOn = false
    }
    
}

