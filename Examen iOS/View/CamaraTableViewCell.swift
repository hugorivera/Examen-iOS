//
//  CamaraTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class CamaraTableViewCell: UITableViewCell {
    
    @IBOutlet weak var camaraImage: UIImageView!
    
//    var delegate : ImagePickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//       addTapGestureRecognizer(for: camaraImage)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func addTapGestureRecognizer(for view:UIImageView){
//        let tap = UITapGestureRecognizer(target: self, action: #selector(camara))
//        tap.numberOfTapsRequired = 1
//        view.isUserInteractionEnabled = true
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func camara(){
//        delegate?.camara()
//    }

}
