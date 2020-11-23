//
//  CustomTableViewController.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit

class CustomTableViewController: BaseViewController, BaseTableViewCellProtocol, UITableViewDataSource, UITableViewDelegate {
    
    var tbleViewBase: UITableView!
    
    private var tableViewVM : BaseTableVMProtocol?
    var cellSelectionStyle: UITableViewCell.SelectionStyle = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func registerNibs() {
        let cellClasses = tableViewVM?.getCellsToRegister() ?? []
        for cell in cellClasses {
            tbleViewBase.register(NSClassFromString("Explore."+cell), forCellReuseIdentifier: cell)
        }
    }
    
    private func setupTableView() {
        self.tbleViewBase.tableFooterView = UIView(frame: .zero)
        self.tbleViewBase.separatorStyle = .none
        self.tbleViewBase.separatorColor = .clear
    }
    
    override func setupViewModel(viewModel: BaseViewModel) {
        super.setupViewModel(viewModel: viewModel)
        guard let tbleVM = viewModel as? BaseTableVMProtocol else {
            return
        }
        self.tableViewVM = tbleVM
        self.registerNibs()
        self.view.bringSubviewToFront(tbleViewBase)
        self.tbleViewBase.dataSource = self
        self.tbleViewBase.delegate = self
        self.tbleViewBase.reloadData()
    }
    
    func cellButtonAction(cell: BaseTableViewCell) { }
    
    func setAdditionalDataToCell(cell: BaseTableViewCell, indexPath: IndexPath) { }
    
    override func presentData() {
        self.tbleViewBase.reloadData()
    }
    
    func cellDidSelected(cell: BaseTableViewCell) {
        self.cellButtonAction(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewVM?.getNumberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellConfig = tableViewVM?.getCellConfig(indexPath: indexPath) else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellConfig.identifier, for: indexPath) as! BaseTableViewCell
        cell.setupCell(config: cellConfig)
        cell.delegate = self
        cell.selectionStyle = cellSelectionStyle
        self.setAdditionalDataToCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewVM?.getRowHeight(indexPath: indexPath) ?? 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableViewVM?.getTableFooterView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewVM?.rowDidSelected(indexPath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewVM?.getNumberOfSections() ?? 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableViewVM?.getViewForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewVM?.getHeightForHeaderInSection(section: section) ?? 0.0
    }
}
