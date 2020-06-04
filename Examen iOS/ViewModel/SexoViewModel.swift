//
//  SexoViewModel.swift
//  Examen iOS
//
//  Created by Alio Mexico on 04/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import Foundation
import UIKit

struct SexoViewModel {
    let titulo: String
    var seleccionado: Bool
    let accessoryType: UITableViewCell.AccessoryType
    
    init(sexo: Sexo) {
        self.titulo = sexo.titulo
        self.seleccionado = sexo.seleccionado
        
        if sexo.seleccionado {
            accessoryType = .checkmark
        } else {
            accessoryType = .none
        }
    }
}
