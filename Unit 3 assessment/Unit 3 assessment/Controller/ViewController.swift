//
//  ViewController.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var theElements = [Elements]() {
        didSet {
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    // need to do a prepare for segue
    
    func loadData() {
        
        ElementsSAPIClient.fetchElements(completion: {
            [weak self] result in
            switch result {
            case .failure(let appError):
                
                self?.showAlert(title: "data is currently unavailable", message: "Error: \(appError)")
            case .success(let elements):
                self?.theElements = elements
            }
        }
        )
        
        
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath)
        
        return cell 
    }
    
}


extension ViewController: UITableViewDelegate {
    
}
