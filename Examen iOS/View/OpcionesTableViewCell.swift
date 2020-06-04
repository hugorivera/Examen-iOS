//
//  OpcionesTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 04/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class OpcionesTableViewCell: UITableViewCell {
    
    var opcionesViewModel: OpcionViewModel!{
        didSet{
            textLabel?.text = opcionesViewModel.titulo
            accessoryType = opcionesViewModel.accessoryType
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
