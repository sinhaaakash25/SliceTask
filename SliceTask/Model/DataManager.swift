//
//  DataManager.swift
//  SliceTask
//
//  Created by Aakash Sinha on 30/10/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import Foundation

protocol DataManagerDelegate {
    func didUpdateOfferList(_ dataManager: DataManager, offers: OffersList)
    func didFailWithError(error: Error)
}

class DataManager {

    let offerURL = "https://wddad/dasdd/dsad"
    
    var delegate: DataManagerDelegate?
    
    func fetchOffers() {
        let urlString = offerURL
        performRequest(with: urlString)
        
    }
    
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
               
                
                if error != nil {
                    //self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    
                    if let offer = self.parseJSON(safeData) {
                        self.delegate?.didUpdateOfferList(self, offers: offer)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ offer: Data) -> OffersList? {
        
        
        
       // print(matchData)
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(OffersData.self, from: offer)
            print(decodedData)
            // populate array to fill detailViewController
            
            let offerdata = OffersList(voucherCode: "", voucherDesc: "", discountTitle: "", discountDesc: "", validTill: "", isExpiringSoon: true, shareData: "", seller: "")
           
            return offerdata
            
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}
