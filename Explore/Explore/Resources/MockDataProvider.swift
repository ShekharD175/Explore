//
//  MockDataProvider.swift
//  Explore
//
//  Created by Shekhar on 22/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import Foundation


class MockDataProvider {
    
    static func fetchCategoryData() -> [CategoryModel]? {
        return self.loadCategoryJson(fileName: "category")
    }
    
    static func fetchTrendingData() -> [TrendingModel]? {
        return self.loadTrendingJson(fileName: "trending")
    }
    
    private static func loadCategoryJson(fileName: String) -> [CategoryModel]? {
        
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let category = try? decoder.decode([CategoryModel].self, from: data)
       else {
            return nil
       }

       return category
    }
    
    private static func loadTrendingJson(fileName: String) -> [TrendingModel]? {
        
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let trending = try? decoder.decode([TrendingModel].self, from: data)
       else {
            return nil
       }

       return trending
    }
}
