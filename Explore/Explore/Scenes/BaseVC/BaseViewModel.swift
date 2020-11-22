//
//  BaseViewModel.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

protocol BaseViewModel: class {
}

protocol BaseTableVMProtocol: BaseViewModel {
    func getNumberOfRowsInSection(section: Int) -> Int
    func getCellConfig(indexPath: IndexPath) -> BaseCellConfig
    func getCellsToRegister() -> [String]
    func getRowHeight(indexPath: IndexPath) -> CGFloat
    func getNumberOfSections() -> Int
    func getViewForHeaderInSection(section: Int) -> UIView
    func getHeightForHeaderInSection(section: Int) -> CGFloat
    func getTableFooterView() -> UIView
    func rowDidSelected(indexPath: IndexPath)
}

protocol BaseViewModelOutputProtocol: class {
    func presentData()
    func showSuccessMessage(message: String)
    func showErrorMessage(message: String)
}

extension BaseTableVMProtocol {
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getTableFooterView() -> UIView {
        return UIView(frame: .zero)
    }
    
    func rowDidSelected(indexPath: IndexPath) {
        
    }
    
    func getViewForHeaderInSection(section: Int) -> UIView {
        return UIView(frame: .zero)
    }
    
    func getHeightForHeaderInSection(section: Int) -> CGFloat {
        return 0.0
    }
}
