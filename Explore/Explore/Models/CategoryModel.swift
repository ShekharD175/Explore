//
//  CategoryModel.swift
//  Explore
//
//  Created by Shekhar on 22/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import Foundation

struct CategoryModel : Codable {
    
    var categoryName: String? = nil
    var categoryImageName: String? = nil
    
    enum CodingKeys: String, CodingKey {

           case categoryName = "category_name"
           case categoryImageName = "category_image"
       }

       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
           categoryImageName = try values.decodeIfPresent(String.self, forKey: .categoryImageName)
       }
}
