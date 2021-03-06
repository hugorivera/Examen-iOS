//
//  TelefonoTableViewCell.swift
//  Examen iOS
//
//  Created by Alio Mexico on 01/06/20.
//  Copyright © 2020 Hugo Rivera. All rights reserved.
//

import UIKit

class TelefonoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    let charactersAllowed = "1234567890"
    
    @IBOutlet weak var telefonoField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        telefonoField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == telefonoField{
            if string.count > 0{
                let disallowedCharacterSet = NSCharacterSet(charactersIn: charactersAllowed).inverted
                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
                
                let resultingStringLength = prospectiveText.count <= 10
                
                result = replacementStringIsLegal && resultingStringLength
            }
        }
        return result
    }

}
