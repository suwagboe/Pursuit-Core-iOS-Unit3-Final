//
//  DetailsViewController.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var elementNumLabel: UILabel!
    @IBOutlet weak var elementSymbolLabel: UILabel!
    @IBOutlet weak var meltingPointLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var discoveredbyLabel: UILabel!
    
  @IBOutlet weak var summaryLabel: UILabel!


    var selectedElement: Elements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()}

    func loadData() {
        guard let e = selectedElement else {
            fatalError("check the segue.. ensure it is going in the right direction")
        }
        
        elementNameLabel.text = e.name
        elementNumLabel.text = e.number.description
        elementSymbolLabel.text = e.melt.description
        weightLabel.text = e.density.description
        discoveredbyLabel.text = e.discovered_by
        summaryLabel.text = e.summary
    }
    
    //favsButton {
    

}
