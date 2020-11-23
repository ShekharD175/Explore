//
//  DashboardViewModel.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

protocol DashboardVMOutputProtocol: BaseViewModelOutputProtocol {
    func navigateToScreen(screen: String)
}

class DashboardViewModel: BaseTableVMProtocol {
    
    var outputDelegate: DashboardVMOutputProtocol?
    
    private var arrOfConfigs: [BaseCellConfig] = [BaseCellConfig]()
    private var selectedTab: Constants.TAB_SELECTION = .category
    private var arrOfSections: [String] = [String]()
    
    init() {
        self.updateCellConfigs()
        self.arrOfSections = [Constants.TRENDING_TYPE.topGainer.rawValue, Constants.TRENDING_TYPE.topSeller.rawValue]
    }
    
    func getNumberOfSections() -> Int {
        return self.selectedTab == Constants.TAB_SELECTION.trending ? 2 : 1
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        return section == 1 ? 2 : self.arrOfConfigs.count
    }
    
    func getViewForHeaderInSection(section: Int) -> UIView {
        
        switch self.selectedTab {
        case .trending:
            let sectionHeaderView = SectionHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Constants.SECTION_HEADER_HEIGHT))
            sectionHeaderView.setSectionTitle(title: self.arrOfSections[section])
            return sectionHeaderView
        default:
            return UIView(frame: .zero)
        }
    }
    
    func getHeightForHeaderInSection(section: Int) -> CGFloat {
        return Constants.SECTION_HEADER_HEIGHT
    }
    
    func getCellConfig(indexPath: IndexPath) -> BaseCellConfig {
        if self.selectedTab == .trending {
            if indexPath.section == 1 {
                return arrOfConfigs[arrOfConfigs.count - (indexPath.row+1)]
            }
            else {
                return arrOfConfigs[indexPath.row]
            }
        }
        else {
            return arrOfConfigs[indexPath.row]
        }
    }
    
    func getCellsToRegister() -> [String] {
        return ["CategoryCell","VendorCell"]
    }
    
    func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func rowDidSelected(indexPath: IndexPath) {
        self.outputDelegate?.navigateToScreen(screen: "")
    }
    
    func tabButtonDidSelected(type: Constants.TAB_SELECTION) {
        self.selectedTab = type
        self.updateCellConfigs()
    }
    
    private func updateCellConfigs() {
        arrOfConfigs.removeAll()
        switch self.selectedTab {
        case .category:
            let arrOfBackgoundColors : [UIColor] = [#colorLiteral(red: 0.5803921569, green: 0.5607843137, blue: 0.9921568627, alpha: 1), #colorLiteral(red: 0.2392156863, green: 0.2078431373, blue: 0.768627451, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.8156862745, blue: 0.1882352941, alpha: 1)]
            
            guard let categoryData = MockDataProvider.fetchCategoryData() else {
                return
            }
            for i in 0..<categoryData.count {
                arrOfConfigs.append(CategoryCellConfig.init(categoryImg: categoryData[i].categoryImageName, categoryTitle: categoryData[i].categoryName, backgroundColor: arrOfBackgoundColors[i]))
            }
            
        case .themes:
            arrOfConfigs.removeAll()
            
        case .trending:
            
            guard let trendingData = MockDataProvider.fetchTrendingData() else {
                return
            }
            for i in 0..<trendingData.count {
                arrOfConfigs.append(VendorCellConfig.init(titleValue: trendingData[i].vendorName, imgCompany: trendingData[i].vendorImage, subTitleValue: trendingData[i].vendorSubtitle, trendingValue: trendingData[i].vendorTrendingValue))
            }
        }
        self.outputDelegate?.presentData()
    }
    
    func getThemesData() -> [ThemeModel] {
        return MockDataProvider.fetchThemesData() ?? [ThemeModel]()
    }
}
