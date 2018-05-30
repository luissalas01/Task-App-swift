//
//  viewcontTaskList.swift
//  TaskApp-Test
//
//  Created by Towa Software on 14/05/18.
//  Copyright © 2018 Towa Sortware. All rights reserved.
//

import UIKit

class viewcontTaskList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let strCellName: String = "tvcTaskCell"
    private var task: TaskModel = TaskModel()
    
    @IBOutlet weak var tvTableView: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        tvTableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //Se inicializan el delegado y datasource del viewController para poder hacer uso de las
        //      interfases implementadas.
        tvTableView.dataSource = self
        tvTableView.delegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //Implementacion del metodo numberOfRowsInSection de la interfase
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TaskDAO.listTasks.count
    }
    
    //Implementacion del metodo celForRowAtIndexPath de la interfase
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Se obtiene la celda reusable del viewController por medio de su nombre
        let cell = tableView.dequeueReusableCell(withIdentifier: strCellName, for: indexPath)
        
        //se cambia el texto de la celda seleccionada por el de la tarea en dicho indice
        cell.textLabel?.text = TaskDAO.listTasks[indexPath.row].strName
        
        return cell
    }
    
    //Implementacion del metodo didSelectRowAtIndexPath de la interfase
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Se obtiene la tarea seleccioada para editar mediante su index
        self.task = TaskDAO.listTasks[indexPath.row]
        
        //se obtiene el view controller de destino
        let vcViewControllerDestino: ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerTask") as! ViewController
        
        //Se manda la tarea al view controller de destino
        vcViewControllerDestino.task = self.task
        
        //Se dispara la navegacion al view controller de Task
        self.navigationController?.pushViewController(vcViewControllerDestino, animated: true)
    }
}
