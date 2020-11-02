//
//  DetailsViewController.swift
//  SliceTask
//
//  Created by Aakash Sinha on 29/10/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    var index:Int?
    
    @IBOutlet weak var share: UIImageView!
    @IBOutlet weak var copyImage: UIImageView!
    @IBOutlet weak var offerCompany: UILabel!
    
    @IBOutlet weak var timeline: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var voucherCodeValue: UILabel!
    @IBOutlet weak var voucherCode: UILabel!
    @IBOutlet weak var voucherDesc: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    @IBOutlet weak var expireView: UIView!
    let  OffersDetails = [
      [
        "voucherCode": "SWIGGYFOOD",
        "voucherDesc": "applicable only on the first order that you place using the slice card",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Mar 31, 2019",
        "isExpiringSoon": "true",
        "discount": "50% OFF",
        "seller": "Swiggy",
        "shareData": "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."
      ],
      [
        "voucherCode": "BMS200",
        "voucherDesc": "applicable only on the first order that you place using the slice card",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Jan 10, 2020",
        "isExpiringSoon": "false",
        "discount": "20% OFF",
        "seller": "bookmyshow",
        "shareData": "Hey, I am buying movie ticket using slice! Try using my invite code ABCD12345 to get credit."
      ],
      [
        "voucherCode": "SWIGGYFOOD",
        "voucherDesc": "applicable only on the first order that you place using the slice app",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Feb 15, 2021",
        "isExpiringSoon": false,
        "discount": "30% OFF",
        "seller": "Swiggy",
        "shareData": "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."
      ]
    ,
    
      [
        "voucherCode": "SWIGGYFOOD",
        "voucherDesc": "applicable only on the first order that you place using the slice card",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Mar 31, 2019",
        "isExpiringSoon": true,
        "discount": "50% OFF",
        "seller": "Swiggy",
        "shareData": "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."
      ],
      [
        "voucherCode": "BMS200",
        "voucherDesc": "applicable only on the first order that you place using the slice card",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Jan 10, 2020",
        "isExpiringSoon": false,
        "discount": "20% OFF",
        "seller": "bookmyshow",
        "shareData": "Hey, I am buying movie ticket using slice! Try using my invite code ABCD12345 to get credit."
      ],
      [
        "voucherCode": "SWIGGYFOOD",
        "voucherDesc": "applicable only on the first order that you place using the slice app",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Feb 15, 2021",
        "isExpiringSoon": false,
        "discount": "30% OFF",
        "seller": "Swiggy",
        "shareData": "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."
      ]
    ,
    
      [
        "voucherCode": "SWIGGYFOOD",
        "voucherDesc": "applicable only on the first order that you place using the slice card",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Mar 31, 2019",
        "isExpiringSoon": true,
        "discount": "50% OFF",
        "seller": "Swiggy",
        "shareData": "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."
      ],
      [
        "voucherCode": "BMS200",
        "voucherDesc": "applicable only on the first order that you place using the slice card",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Jan 10, 2020",
        "isExpiringSoon": false,
        "discount": "20% OFF",
        "seller": "bookmyshow",
        "shareData": "Hey, I am buying movie ticket using slice! Try using my invite code ABCD12345 to get credit."
      ],
      [
        "voucherCode": "SWIGGYFOOD",
        "voucherDesc": "applicable only on the first order that you place using the slice app",
        "discountTitle": "₹100 off",
        "discountDesc": "your first order on Swiggy using the slice card comes with ₹100 off.",
        "validTill": "valid till Feb 15, 2021",
        "isExpiringSoon": false,
        "discount": "30% OFF",
        "seller": "Swiggy",
        "shareData": "Hey, I am buying food using slice! Try using my invite code ABCD12345 to get credit."
      ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        copyImage.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        copyImage.addGestureRecognizer(tapRecognizer)
        share.isUserInteractionEnabled = true
        let tapRecognizers = UITapGestureRecognizer(target: self, action: #selector(shareImageTapped))
        share.addGestureRecognizer(tapRecognizers)
        
        setRadius()
        
        setValues()
    }
    
    func setRadius(){
        myView.layer.cornerRadius = 15
        offerCompany.layer.cornerRadius = 5
        offerCompany.layer.masksToBounds = true
        expireView.layer.cornerRadius = 5
    }
    
    func setValues(){
        offerCompany.text = (OffersDetails[index!]["seller"])! as? String
        voucherDesc.text = (OffersDetails[index!]["voucherDesc"])! as? String
        desc.text = (OffersDetails[index!]["discountDesc"])! as? String
        offLabel.text = (OffersDetails[index!]["discountTitle"])! as? String
        voucherCodeValue.text = (OffersDetails[index!]["voucherCode"])! as? String
        timeline.text = (OffersDetails[index!]["validTill"])! as? String
      
        if (OffersDetails[index!]["isExpiringSoon"]) as? String == "true"{
            expireView.isHidden = false
           
        }
        else {
            expireView.isHidden = true
        }
    }
    

    @objc func imageTapped(recognizer: UITapGestureRecognizer){
        print("image Tapped")
        let pasteboard = UIPasteboard.general
        pasteboard.string = voucherCodeValue.text
        
    }
    
    @objc func shareImageTapped(recognizer: UITapGestureRecognizer){
        print("share Tapped")
       let items = ["\((offLabel.text)!):\((voucherCodeValue.text)!)"]
       let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
       present(ac, animated: true)
    }
}
