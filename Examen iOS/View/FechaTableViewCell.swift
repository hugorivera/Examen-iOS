//
//  FechaTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class FechaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fechaField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        datePicker.addTarget(self, action: #selector(handlerDate), for: .valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func handlerDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        fechaField.text = dateFormatter.string(from: datePicker.date)
    }

}
