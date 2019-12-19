//
//  favsViewController.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class favsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var allFavs = [Elements]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadFavsData()
        tableView.delegate = self

    }
    
    
    func loadFavsData() {
        ElementsSAPIClient.getFavs(elememnts: allFavs, completion: {
           [weak self] result in
            switch result{
            case .failure(let appError):
                DispatchQueue.main.async {
                  self?.showAlert(title: "OOPPPPs", message: "Something went wrong... : \(appError)")
                }
            case .success(let elements):
                // !!!!
                    // need help filtering by the name so that way they all appear..
                // right now only one appears
                var new = [Elements]()
                for e in elements {
                    if e.favoritedBy?.lowercased() == "shaniya".lowercased() {
                        new.append(e)
                }
                    self?.allFavs = [e]
                }
                
            }
        })
      
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? DetailsViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not segue properly to details controller")
        }
        
        let selectedFav = allFavs[indexPath.row]
        
        dvc.selectedElement = selectedFav
    }

}

extension favsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementCell else {
            fatalError("couldnt  dequeue as ElementCell please try again")
        }
            
            let favs = allFavs[indexPath.row]
        
        cell.configureCell(for: favs)
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFavs.count
    }
    }
    
extension favsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
