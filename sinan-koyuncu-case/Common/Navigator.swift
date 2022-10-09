//
//  BaseNavigator.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 5.10.2022.
//

import UIKit

protocol Navigator {
    var navigationController: UINavigationController? { get set }
    
    func push(_ viewController: UIViewController)
    func present(_ viewController: UIViewController)
    func dismiss()
}

class BaseNavigator: Navigator {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.present(viewController, animated: true)
    }
    
    func dismiss() {
        navigationController?.dismiss(animated: true)
    }
}
