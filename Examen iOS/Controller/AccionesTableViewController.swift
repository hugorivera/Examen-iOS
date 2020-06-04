//
//  AccionesTableViewController.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit
import SDWebImage

class AccionesTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var opcionesSelec: [OpcionViewModel] = []
    
    var sexoViewModels = [SexoViewModel]()
    var sexos = [
        Sexo(titulo: "Femenino", seleccionado: false),
        Sexo(titulo: "Masculino", seleccionado: false)
    ]
    var sexoVisible = false
    
    var colorViewModels = [ColorViewModel]()
    var colores = [
        Color(titulo: "Brown", color: .brown, seleccionado: true),
        Color(titulo: "Blue", color: .blue, seleccionado: true),
        Color(titulo: "Cyan", color: .cyan, seleccionado: true),
        Color(titulo: "Green", color: .green, seleccionado: true),
        Color(titulo: "Orange", color: .orange, seleccionado: true),
    ]
    var coloresVisible = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.sexoViewModels = sexos.map({return
        SexoViewModel(sexo: $0)} )
        
        self.colorViewModels = colores.map({return
            ColorViewModel(color: $0)})
        
        sexoVisible = opcionesSelec[5].seleccionado
        coloresVisible = opcionesSelec[6].seleccionado
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section {
        case 0:
            return 5
        case 1:
            return sexoViewModels.count
        case 2:
            return colorViewModels.count
        default:
            fatalError("secciones desconocidas")
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "camaraAccionesCell", for: indexPath) as! CamaraTableViewCell
                let tap = UITapGestureRecognizer(target: self, action: #selector(camara))
                cell.camaraImage.isUserInteractionEnabled = true
                cell.camaraImage.addGestureRecognizer(tap)
                return mostrarCelda(cell: cell, visible: opcionesSelec[indexPath.row].seleccionado)
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "imagenAccionesCell", for: indexPath) as! ImagenTableViewCell
                return mostrarCelda(cell: cell, visible: opcionesSelec[indexPath.row].seleccionado)
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "textoAccionesCell", for: indexPath) as! TextoTableViewCell
                return mostrarCelda(cell: cell, visible: opcionesSelec[indexPath.row].seleccionado)
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "telefonoAccionesCell", for: indexPath) as! TelefonoTableViewCell
                return mostrarCelda(cell: cell, visible: opcionesSelec[indexPath.row].seleccionado)
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "fechaAccionesCell", for: indexPath) as! FechaTableViewCell
                return mostrarCelda(cell: cell, visible: opcionesSelec[indexPath.row].seleccionado)
            }
        } else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "sexoAccionesCell", for: indexPath) as! SexoTableViewCell
            
            let sexoViewModel = sexoViewModels[indexPath.row]
            cell.sexoViewModel = sexoViewModel
            cell.accessoryType = checkCelda(check: sexoViewModels[indexPath.row].seleccionado)
            return mostrarCelda(cell: cell, visible: sexoVisible)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "coloresAccionesCell", for: indexPath) as! ColorTableViewCell
            
            let colorViewModel = colorViewModels[indexPath.row]
            cell.colorViewModel = colorViewModel
            cell.accessoryType = checkCelda(check: colorViewModels[indexPath.row].seleccionado)
            return mostrarCelda(cell: cell, visible: coloresVisible)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return tamañoCelda(tamaño: 250, visible: opcionesSelec[indexPath.row].seleccionado)
            case 1:
                return tamañoCelda(tamaño: 250, visible: opcionesSelec[indexPath.row].seleccionado)
            case 2:
                return tamañoCelda(tamaño: 83, visible: opcionesSelec[indexPath.row].seleccionado)
            case 3:
                return tamañoCelda(tamaño: 83, visible: opcionesSelec[indexPath.row].seleccionado)
            default:
                return tamañoCelda(tamaño: 255, visible: opcionesSelec[indexPath.row].seleccionado)
            }
        } else if indexPath.section == 1{
            return tamañoCelda(tamaño: 57, visible: sexoVisible)
        } else {
            return tamañoCelda(tamaño: 57, visible: coloresVisible)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if sexoVisible && coloresVisible{
//            return "Section \(section)"
//        } else {
//            return nil
//        }
        return "Sección \(section)"

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if (tableView.cellForRow(at: IndexPath.init(row: 0, section: 1))?.accessoryType == UITableViewCell.AccessoryType.none) {
                tableView.cellForRow(at: IndexPath.init(row: 0, section: 1))?.accessoryType = UITableViewCell.AccessoryType.checkmark
                tableView.cellForRow(at: IndexPath.init(row: 1, section: 1))?.accessoryType = UITableViewCell.AccessoryType.none
                sexoViewModels[0].seleccionado = true
                sexoViewModels[1].seleccionado = false
            }else if (tableView.cellForRow(at: IndexPath.init(row: 1, section: 1))?.accessoryType == UITableViewCell.AccessoryType.none){
                tableView.cellForRow(at: IndexPath.init(row: 0, section: 1))?.accessoryType = UITableViewCell.AccessoryType.none
                tableView.cellForRow(at: IndexPath.init(row: 1, section: 1))?.accessoryType = UITableViewCell.AccessoryType.checkmark
                sexoViewModels[0].seleccionado = false
                sexoViewModels[1].seleccionado = true
            }
        }else if indexPath.section == 2{
            if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none) {
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                colorViewModels[indexPath.row].seleccionado = true
            }else{
                var colorCheck = 0
                for i in 0 ..< colorViewModels.count {
                    if colorViewModels[i].seleccionado{
                        colorCheck += 1
                    }
                }
                if colorCheck > 1 {
                    colorViewModels[indexPath.row].seleccionado = false
                    tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
                }
            }
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
    
    private func checkCelda(check: Bool) -> UITableViewCell.AccessoryType{
        if check{
            return UITableViewCell.AccessoryType.checkmark
        }else{
            return UITableViewCell.AccessoryType.none
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
