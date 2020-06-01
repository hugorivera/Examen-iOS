//
//  AccionesTableViewController.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

//protocol ImagePickerDelegate {
//    func camara()
//}

class AccionesTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var seleccionado: [Bool] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "camaraAccionesCell", for: indexPath) as! CamaraTableViewCell
            let tap = UITapGestureRecognizer(target: self, action: #selector(camara))
            cell.camaraImage.isUserInteractionEnabled = true
            cell.camaraImage.addGestureRecognizer(tap)
            return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imagenAccionesCell", for: indexPath) as! ImagenTableViewCell
            return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textoAccionesCell", for: indexPath) as! TextoTableViewCell
            return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "telefonoAccionesCell", for: indexPath) as! TelefonoTableViewCell
            return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return tamañoCelda(tamaño: 250, visible: seleccionado[indexPath.row])
        case 1:
            return tamañoCelda(tamaño: 250, visible: seleccionado[indexPath.row])
        case 2:
            return tamañoCelda(tamaño: 44, visible: seleccionado[indexPath.row])
        default:
            return tamañoCelda(tamaño: 44, visible: seleccionado[indexPath.row])
        }
    }
    
    // MARK: - Métodos
    
    @objc func camara(){
        print("tap")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CamaraTableViewCell
            cell.camaraImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    private func mostrarCelda(cell: UITableViewCell, visible: Bool) -> UITableViewCell {
        if visible{
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }
        return cell
    }
    
    private func tamañoCelda(tamaño: CGFloat, visible: Bool) -> CGFloat{
        if visible {
            return tamaño
        } else {
            return 0.0
        }
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
