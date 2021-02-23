//
//  CustomXibViewController.swift
//  UITableViewAnalisys
//
//  Created by Renato Mateus on 22/02/21.
//

import UIKit

class CustomXibViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let travelsList: Array<TravelPackage> = packageTravels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let actualTravel = self.travelsList[indexPath.row]
        if(actualTravel.id.isMultiple(of: 2)){
            let cell = Bundle.main.loadNibNamed("TableViewCellTypeTwo", owner: self, options: nil)?.first as! TableViewCellTypeTwo
            cell.label.text = actualTravel.title
            cell.imageV.image = UIImage(named: actualTravel.images[0])
            return cell
        }
        else{
            let cell = Bundle.main.loadNibNamed("TableViewCellTypeOne", owner: self, options: nil)?.first as! TableViewCellTypeOne
            cell.label.text = actualTravel.title
            cell.imageV.image = UIImage(named: actualTravel.images[0])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let actualTravel = self.travelsList[indexPath.row]
        if(actualTravel.id.isMultiple(of: 2)){
            return 160
        }
        else{
            return 75
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let packageSelected = packageTravels[indexPath.item]
        let dvc = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        dvc.selectedTravel = packageSelected
        
        self.present(dvc, animated: true, completion: nil)
            
    }
    
    
}
