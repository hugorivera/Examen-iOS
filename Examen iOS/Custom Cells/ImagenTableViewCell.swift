//
//  ImagenTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class ImagenTableViewCell: UITableViewCell {

    @IBOutlet weak var descargaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
