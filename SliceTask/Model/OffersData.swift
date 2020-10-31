//
//  OffersData.swift
//  SliceTask
//
//  Created by Aakash Sinha on 30/10/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import Foundation

struct OffersData : Codable{
    let  data : [[DataList]]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        data = try values.decodeIfPresent([[DataList]].self, forKey: .data)!
    }
    
}

struct DataList : Codable {
    let voucherCode : String
    let voucherDesc : String
    let discountTitle : String
    let discountDesc : String
    let validTill : String
    let isExpiringSoon : Bool
    let shareData : String
    let seller : String
    
    
    enum CodingKeys: String, CodingKey {
        case voucherCode = "voucherCode"
        case voucherDesc = "voucherDesc"
        case discountTitle = "discountTitle"
        case discountDesc = "discountDesc"
        case validTill = "validTill"
        case isExpiringSoon = "isExpiringSoon"
        case shareData = "shareData"
        case seller = "seller"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        voucherCode = try values.decodeIfPresent(String.self, forKey: .voucherCode)!
        voucherDesc = try values.decodeIfPresent(String.self, forKey: .voucherDesc)!
        discountTitle = try values.decodeIfPresent(String.self, forKey: .discountTitle)!
        discountDesc = try values.decodeIfPresent(String.self, forKey: .discountDesc)!
        validTill = try values.decodeIfPresent(String.self, forKey: .validTill)!
        seller = try values.decodeIfPresent(String.self, forKey: .seller)!
        shareData = try values.decodeIfPresent(String.self, forKey: .shareData)!
        isExpiringSoon = try values.decodeIfPresent(Bool.self, forKey: .isExpiringSoon)!
        
        
    }
}


struct OffersList {
    let voucherCode : String
    let voucherDesc : String
    let discountTitle : String
    let discountDesc : String
    let validTill : String
    let isExpiringSoon : Bool
    let shareData : String
    let seller : String
    
}
