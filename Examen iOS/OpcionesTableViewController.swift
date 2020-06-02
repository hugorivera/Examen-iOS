//
//  OpcionesTableViewController.swift
//  Examen iOS
//
//  Created by Alio Mexico on 31/05/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class OpcionesTableViewController: UITableViewController {
    
    var opcionesString: [String] = ["Cámara", "Foto", "Nombre Completo", "Número telefónico", "Fecha de nacimiento", "Sexo", "Color Favorito"]
    var opcionesSelec: [Bool] = [false, false, false, false, false, false, false,]
    
    var goToNextController = false

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Opciones"
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        goToNextController = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return opcionesString.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "opcionesCell", for: indexPath)
        cell.textLabel?.text = opcionesString[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.none

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none) {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            opcionesSelec[indexPath.row] = true
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            opcionesSelec[indexPath.row] = false
            goToNextController = false
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return setButtonFooter()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45
    }
    
    func setButtonFooter() -> UIView{
        let Footer = UIView(frame: CGRect(x: 0, y: 0, width: Double(self.tableView.frame.size.width), height: 45))
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: Footer.frame.size.width, height: Footer.frame.size.height)
        button.setTitle("Siguiente", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(sendInfo), for: .touchUpInside)
        
        Footer.addSubview(button)
        Footer.bringSubviewToFront(button)
        return Footer
    }
    
    @objc func sendInfo(){
        for i in 0 ..< opcionesSelec.count {
            if opcionesSelec[i]{
                goToNextController = true
            }
        }
        
        if goToNextController{
            let nextViewController = self.storyboard!.instantiateViewController(identifier: "accionesController") as! AccionesTableViewController
            nextViewController.seleccionado = opcionesSelec
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            alertas(titulo: "Información incompleta", mensaje: "Favor de seleccionar al menos una opción", textoBoton: "Aceptar", controlador: self)
        }
    }
    
    func alertas(titulo: String, mensaje: String, textoBoton: String, controlador: UIViewController){
        let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: textoBoton, style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        controlador.present(alertController, animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
