//
//  AccionesTableViewController.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit
import SDWebImage

//protocol ImagePickerDelegate {
//    func camara()
//}

class AccionesTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var seleccionado: [Bool] = []
    let sexo: [String] = ["Femenino", "Masculino"]
    var sexoVisible = false
    var sexoSelecc: [Bool] = [false, false]
    let colores: [String] = ["Brown", "Blue", "Cyan", "Green", "Orange"]
    let color: [UIColor] = [.brown, .blue, .cyan, .green, .orange]
    var coloresVisible = false
    var colorSelecc: [Bool] = [true, true, true, true, true]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        sexoVisible = seleccionado[5]
        coloresVisible = seleccionado[6]
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
            return sexo.count
        case 2:
            return colores.count
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
                return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "imagenAccionesCell", for: indexPath) as! ImagenTableViewCell
                cell.descargaImage.sd_setImage(with: URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercrasft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"), placeholderImage: UIImage(named: "placeholder"))
                return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "textoAccionesCell", for: indexPath) as! TextoTableViewCell
                return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "telefonoAccionesCell", for: indexPath) as! TelefonoTableViewCell
                return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "fechaAccionesCell", for: indexPath) as! FechaTableViewCell
                return mostrarCelda(cell: cell, visible: seleccionado[indexPath.row])
            }
        } else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "sexoAccionesCell", for: indexPath)
            cell.textLabel?.text = sexo[indexPath.row]
            cell.accessoryType = checkCelda(check: sexoSelecc[indexPath.row])
            return mostrarCelda(cell: cell, visible: sexoVisible)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "coloresAccionesCell", for: indexPath)
            cell.textLabel?.text = colores[indexPath.row]
            cell.textLabel?.textColor = color[indexPath.row]
            cell.accessoryType = checkCelda(check: colorSelecc[indexPath.row])
            return mostrarCelda(cell: cell, visible: coloresVisible)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return tamañoCelda(tamaño: 250, visible: seleccionado[indexPath.row])
            case 1:
                return tamañoCelda(tamaño: 250, visible: seleccionado[indexPath.row])
            case 2:
                return tamañoCelda(tamaño: 83, visible: seleccionado[indexPath.row])
            case 3:
                return tamañoCelda(tamaño: 83, visible: seleccionado[indexPath.row])
            default:
                return tamañoCelda(tamaño: 255, visible: seleccionado[indexPath.row])
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
                sexoSelecc[0] = true
                sexoSelecc[1] = false
            }else if (tableView.cellForRow(at: IndexPath.init(row: 1, section: 1))?.accessoryType == UITableViewCell.AccessoryType.none){
                tableView.cellForRow(at: IndexPath.init(row: 0, section: 1))?.accessoryType = UITableViewCell.AccessoryType.none
                tableView.cellForRow(at: IndexPath.init(row: 1, section: 1))?.accessoryType = UITableViewCell.AccessoryType.checkmark
                sexoSelecc[0] = false
                sexoSelecc[1] = true
            }
        }else if indexPath.section == 2{
            if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none) {
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                colorSelecc[indexPath.row] = true
            }else{
                var colorCheck = 0
                for i in 0 ..< colorSelecc.count {
                    if colorSelecc[i]{
                        colorCheck += 1
                    }
                }
                if colorCheck > 1 {
                    colorSelecc[indexPath.row] = false
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
