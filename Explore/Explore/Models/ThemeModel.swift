//
//  ThemeModel.swift
//  Explore
//
//  Created by Shekhar on 23/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import Foundation

struct ThemeModel : Codable {
    
    var themeName: String? = nil
    var themeImageName: String? = nil
    
    enum CodingKeys: String, CodingKey {

           case themeName = "theme_name"
           case themeImageName = "theme_image"
       }

       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           themeName = try values.decodeIfPresent(String.self, forKey: .themeName)
           themeImageName = try values.decodeIfPresent(String.self, forKey: .themeImageName)
       }
}
