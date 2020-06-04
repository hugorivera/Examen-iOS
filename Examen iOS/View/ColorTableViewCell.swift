//
//  ColorTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 04/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    var colorViewModel: ColorViewModel!{
        didSet{
            textLabel?.text = colorViewModel.titulo
            accessoryType = colorViewModel.accessoryType
            textLabel?.textColor = colorViewModel.color
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
