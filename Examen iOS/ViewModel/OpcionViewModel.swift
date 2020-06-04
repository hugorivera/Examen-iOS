//
//  OpcionViewModel.swift
//  Examen iOS
//
//  Created by Alio Mexico on 04/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import Foundation
import UIKit

struct OpcionViewModel {
    let titulo: String
    var seleccionado: Bool
    let accessoryType: UITableViewCell.AccessoryType
    
    init(opcion: Opcion) {
        self.titulo = opcion.titulo
        self.seleccionado = opcion.seleccionado
        
        if opcion.seleccionado {
            accessoryType = .checkmark
        } else {
            accessoryType = .none
        }
    }
}
