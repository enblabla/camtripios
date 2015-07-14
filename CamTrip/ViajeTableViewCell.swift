//
//  ViajeTableViewCell.swift
//  CamTrip
//
//  Created by Enrique Blasco Blanquer on 6/7/15.
//  Copyright (c) 2015 Enrique Blasco Blanquer. All rights reserved.
//

import UIKit

class ViajeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var txtTitulo: UILabel!
    
    @IBOutlet weak var txtFecha: UILabel!

    @IBOutlet weak var portada: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
