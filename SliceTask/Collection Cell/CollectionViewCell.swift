//
//  CollectionViewCell.swift
//  SliceTask
//
//  Created by Aakash Sinha on 29/10/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import UIKit



class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var myImageView : UIImageView!

    static let identifier = "CollectionViewCell"
       
       static func nib() -> UINib {
           return UINib(nibName: "CollectionViewCell", bundle: nil)
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
         myImageView.layer.cornerRadius = 25
        // Initialization code
    }
    
    
    public func configure(with model : Model) {
        self.myImageView.image = UIImage(named: model.imageName)
       // self.myImageView.contentMode = .scaleAspectFit
    }

}
