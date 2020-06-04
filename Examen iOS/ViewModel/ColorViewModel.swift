//
//  ColorViewModel.swift
//  Examen iOS
//
//  Created by Alio Mexico on 04/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import Foundation
import UIKit

struct ColorViewModel{
    let titulo: String
    let color: UIColor
    var seleccionado: Bool
    let accessoryType: UITableViewCell.AccessoryType
    
    init(color: Color) {
        self.titulo = color.titulo
        self.color = color.color
        self.seleccionado = color.seleccionado
        
        if color.seleccionado {
            accessoryType = .checkmark
        } else {
            accessoryType = .none
        }
    }
}
