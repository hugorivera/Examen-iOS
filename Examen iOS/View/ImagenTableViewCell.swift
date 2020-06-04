//
//  ImagenTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit
import SDWebImage

class ImagenTableViewCell: UITableViewCell {

    @IBOutlet weak var descargaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        descargaImage.sd_setImage(with: URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercrasft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"), placeholderImage: UIImage(named: "placeholder"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
