//
//  TrendingModel.swift
//  Explore
//
//  Created by Shekhar on 22/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import Foundation

struct TrendingModel : Codable {
    
    var vendorName: String? = nil
    var vendorImage: String? = nil
    var vendorSubtitle: String? = nil
    var vendorTrendingValue: String? = nil
    var trendingTypeStr: String? = nil
    var trendingType: Constants.TRENDING_TYPE = .topGainer
    
    enum CodingKeys: String, CodingKey {

        case vendorName = "vendor_name"
        case vendorImage = "vendor_image"
        case vendorSubtitle = "vendor_subtitle"
        case vendorTrendingValue = "vendor_trending_value"
        case trendingTypeStr = "trending_type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vendorName = try values.decodeIfPresent(String.self, forKey: .vendorName)
        vendorImage = try values.decodeIfPresent(String.self, forKey: .vendorImage)
        vendorSubtitle = try values.decodeIfPresent(String.self, forKey: .vendorSubtitle)
        vendorTrendingValue = try values.decodeIfPresent(String.self, forKey: .vendorTrendingValue)
        trendingTypeStr = try values.decodeIfPresent(String.self, forKey: .trendingTypeStr)
        
        trendingType = Constants.TRENDING_TYPE.init(rawValue: trendingTypeStr!) ?? Constants.TRENDING_TYPE.topGainer
    }
}
