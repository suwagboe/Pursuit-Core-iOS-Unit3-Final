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
    
  @IBOutlet weak var summaryLabel: UITextView!

    
    // some of the elements are being found nil and crashing the HELP!!! CONFUSION!!!!
    

    var selectedElement: Elements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedElement?.name
        
        loadData()}

    func loadData() {
        guard let e = selectedElement else {
            fatalError("check the segue.. ensure it is going in the right direction")
        }
        
        elementNameLabel.text = "This elements name is \(e.name)"
        elementNumLabel.text = "The number associates with \(e.name) is \(e.number.description)"
        elementSymbolLabel.text = " \(e.name) symbol is \(e.symbol)."
        weightLabel.text = "The weight of this element is \(e.density!)"
        discoveredbyLabel.text = " It was \(e.discovered_by!) that discovered this element"
      summaryLabel.text = e.summary
        meltingPointLabel.text = "\(e.name) will melt at \(e.melt ?? 0) degrees"
        
        elementImage.getImage(with: "http://images-of-elements.com/\(e.name.lowercased()).jpg"){
            [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.elementImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.elementImage.image = image

                }
            }
        }
    }
    
    //favsButton {
    

    @IBAction func addFavs(_ sender: UIBarButtonItem) {
        
        selectedElement?.favoritedBy = "shaniya"
        
        ElementsSAPIClient.postFavoriteElements(element: selectedElement!, completion: {
            [weak self]
            result in
            switch result {
            case .failure(let appError):
            DispatchQueue.main.async {
                self?.showAlert(title: "NOPE", message: "you did something wronf please try again: \(appError)")
                }
            case .success:
                DispatchQueue.main.async {
                    self?.showAlert(title: "IT WORKED", message: "It worked this element has now been added to your favorties")}
            }
        })
    }

}
