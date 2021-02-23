//
//  CollectionViewController.swift
//  UITableViewAnalisys
//
//  Created by Renato Mateus on 22/02/21.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
   
    let packageList: Array<TravelPackage> = packageTravels
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isUserInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.packageList.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width / 2
        return CGSize(width: cellWidth-20, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let packageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackageCollectionViewCell
        
       
       
        
        let actualPackage = packageList[indexPath.item]
        //packageCell.backgroundColor = .blue
        packageCell.labelViewCell.text = actualPackage.title
        packageCell.imageViewCell.image = UIImage(named: actualPackage.images[0])
        packageCell.imageViewCell.layer.cornerRadius = 10
        packageCell.imageViewCell.layer.masksToBounds = true
        packageCell.imageViewCell.frame = CGRect(x: 5, y: 5, width: 145, height: 103)
        packageCell.imageViewCell.clipsToBounds = true
        packageCell.layer.borderWidth = 0.5
        packageCell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        packageCell.layer.cornerRadius = 10
        
        
        return packageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let packageSelected = packageTravels[indexPath.item]
            print(packageSelected.description)
            let controller = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            controller.selectedTravel = packageSelected
            self.present(controller, animated: true, completion: nil)
            
    }
    
}
