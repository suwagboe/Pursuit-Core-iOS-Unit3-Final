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
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

     func configureCell( for e: Elements) {
      //  var newNum: Int
        
     //   elementSymbol.text = element // need to get the symbol or the number for this part
        
        // Ive unwra
        //elementSymbol.text = e.symbol
        
//        if e.symbol != nil {
//            elementSymbol.text = e.symbol
//        } else {
//            elementSymbol.text = "not avaiable"
//        }
        
        // make sure the elements correspond between BOTH OF the CELLS!!!!
        numberLabel.text = e.number?.description
       weight.text = e.density?.description
        
        elementNameLabel.text = e.name
        
        elementThumbnailImage.getImage(with: "http://www.theodoregray.com/periodictable/Tiles/0\(e.number)/s7.JPG"){
            [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
    self?.elementThumbnailImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
    self?.elementThumbnailImage.image = image
                }
            }
        }
    }

}
