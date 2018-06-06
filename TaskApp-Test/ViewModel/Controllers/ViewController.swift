//
//  ViewController.swift
//  TaskApp-Test
//
//  Created by Luis on 5/8/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var taskVM: taskViewModel?
    {
        didSet
        {
            BindingControls()
        }
    }
    
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
        
        BindingControls()
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
    
    //Cuando el usuario mueve el slider
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
        self.taskVM?.AddTask(name: self.tfTitle.text!,
                     description: self.tfDescription.text,
                     percentage: Int(self.sldrPercentage.value),
                     done: swchDone.isOn)
        
        //Crear objeto para mostrar alerta
        let alert = UIAlertController(title: "TaskApp", message: "The task: " + (self.taskVM?.strName)! + " was created", preferredStyle: UIAlertControllerStyle.alert)
        
        //Crear accion (boton con un evento o accion) de alerta
        let action  = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        {
            _ in alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        
        //Agregar accion a la alerta y mostrarla
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func EditTask()
    {
        taskVM?.EditTask(name: self.tfTitle.text!,
                        description: self.tfDescription.text,
                        percentage: Int(self.sldrPercentage.value),
                        done: swchDone.isOn)
        
        //Navegar al menú principal
        self.navigationController?.popViewController(animated: true)
    }
    
    private func DeleteTask()
    {
        //Regresa al menú principal
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func BindingControls()
    {
        if (
            !self.isViewLoaded
            )
        {
            return
        }
        
        guard let taskVM = taskVM else {
            self.taskVM = taskViewModel()
            return
        }
        
        if (
            taskVM.intId != nil
            )
        {
            boolEdit = true
            btnDelete.isHidden = false
    
            self.tfTitle.text = taskVM.strName
            self.tfDescription.text = taskVM.strDescription
            self.sldrPercentage.value = Float((taskVM.intPercentage)!)
            self.lblPercentage.text = (taskVM.intPercentage?.description)! + " %"
            
            if (
                taskVM.intPercentage == 100
            )
            {
                self.swchDone.isOn = true
            }
            else
            {
                self.swchDone.isOn = false
            }
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

