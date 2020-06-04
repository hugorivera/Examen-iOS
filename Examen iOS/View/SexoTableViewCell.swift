//
//  SexoTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 04/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class SexoTableViewCell: UITableViewCell {
    
    var sexoViewModel: SexoViewModel!{
        didSet{
            textLabel?.text = sexoViewModel.titulo
            accessoryType = sexoViewModel.accessoryType
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
