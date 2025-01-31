//
//  ViewController.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class mainElementsViewController: UIViewController {
    
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
        loadData()
    }
    // need to do a prepare for segue
    
    func loadData() {
        
        ElementsSAPIClient.fetchElements(completion: {
            [weak self] result in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                   self?.showAlert(title: "data is currently unavailable", message: "Error: \(appError)")
                }
            case .success(let elements):
                self?.theElements = elements
            }
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? DetailsViewController, let indexPath = tableView.indexPathForSelectedRow else{
            fatalError("could not segue properly to details controller")
        }
        
        let selected = theElements[indexPath.row]
        
        dvc.selectedElement = selected
        
    }

}

extension mainElementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementCell else{
            fatalError("couldnt dequeue to custom cell ")
        }
        //elementCell
        
        // this access the specific cell that was clicked...
        let element = theElements[indexPath.row]
        
        cell.configureCell(for: element)
        
        return cell 
    }
    
}


extension mainElementsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
}
