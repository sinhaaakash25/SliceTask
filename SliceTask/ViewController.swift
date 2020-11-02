//
//  ViewController.swift
//  SliceTask
//
//  Created by Aakash Sinha on 29/10/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , DetailCellDelegate {
    
    
    
    
    
    @IBOutlet weak var myView: UIView!
    
    let myOffer = "Top Offer"
    
    
    @IBOutlet weak var tableView: UITableView!
    var tableCell = TableViewCell()
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableCell.delegate = self
        myView.layer.cornerRadius = 15
        models.append(Model(imageName: "food1"))
        models.append(Model(imageName: "food2"))
        models.append(Model(imageName: "food3"))
        models.append(Model(imageName: "food4"))
        models.append(Model(imageName: "food5"))
        models.append(Model(imageName: "food1"))
        models.append(Model(imageName: "food2"))
        models.append(Model(imageName: "food3"))
        models.append(Model(imageName: "food4"))
        models.append(Model(imageName: "food5"))
        
        
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        cell.configure(with: models)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.frame.origin.x = -cell.frame.width
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            cell.frame.origin.x = 0
        }, completion: nil)
        
        
        
    }
    
    
    func didSelect(_ data: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "moveToDetails") as? DetailsViewController
        vc?.index = data
        self.present(vc!, animated: true, completion: nil)
        
    }
}



struct Model {
    let imageName : String
    init(imageName : String) {
        self.imageName = imageName
    }
}
