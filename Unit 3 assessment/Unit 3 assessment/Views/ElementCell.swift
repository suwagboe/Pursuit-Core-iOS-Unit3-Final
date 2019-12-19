//
//  ElementCell.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {
    
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var elementSymbol: UILabel!// the number
    @IBOutlet weak var elementThumbnailImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

     func configureCell( for element: Elements) {
        
     //   elementSymbol.text = element // need to get the symbol or the number for this part
        elementNameLabel.text = element.name
        //elementThumbnailImage.getImage
        
       // need to use the link below for the image... //http://www.theodoregray.com/periodictable/Tiles/{ElementIDWithThreeDigits}/s7.JPG
        
        elementSymbol.text = element.symbol
        
    }

}
