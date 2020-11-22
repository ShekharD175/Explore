//
//  AppCoordinator.swift
//  Explore
//
//  Created by Shekhar on 20/11/20.
//  Copyright © 2020 Shekhar. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator {

    static var rootViewController: UIViewController {
        return dashboardController
    }
    
    private static var dashboardController: UIViewController {
        let dashboardController = dashboardStoryboard.instantiateViewController(withIdentifier: "DashboardController")
        let navigationController = UINavigationController.init(rootViewController: dashboardController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
    
    private static var dashboardStoryboard: UIStoryboard {
        return UIStoryboard.init(name: Constants.STORYBOARD_NAMES.dashboard.rawValue, bundle: nil)
    }
}
