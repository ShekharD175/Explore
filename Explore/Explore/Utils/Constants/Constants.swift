//
//  Constants.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

class Constants {
    
    enum STORYBOARD_NAMES: String {
        case dashboard = "Dashboard"
    }
    
    enum TAB_SELECTION: String {
        case themes = "Themes"
        case category = "Category"
        case trending = "Trending"
    }
    
    enum TRENDING_TYPE: String {
        case topGainer = "Top Gainers"
        case topSeller = "Top Sellers"
    }
    
    static let TOPBAR_HEIGHT : CGFloat = 80.0
    static let TOPBAR_BTN_HEIGHT : CGFloat = 25.0
    static let STANDARD_PADDING : CGFloat = 15.0
    static let SHORT_PADDING : CGFloat = 10.0
    static let TAB_SELECTION_VIEW_HEIGHT : CGFloat = 40.0
    static let SECTION_HEADER_HEIGHT : CGFloat = 50.0
}
