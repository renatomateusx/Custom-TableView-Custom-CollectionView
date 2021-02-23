//
//  DetailViewController.swift
//  UITableViewAnalisys
//
//  Created by Renato Mateus on 22/02/21.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedTravel: TravelPackage!
    
    @IBOutlet weak var imageDescription: UIImageView!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        if let selected = self.selectedTravel {
            self.imageDescription.image = UIImage(named: selected.images[0])
            self.labelDescription.text = selected.description
        }
        
    }
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
