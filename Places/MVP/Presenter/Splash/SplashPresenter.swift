//
//  SplashPresenter.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol SplashViewPresenter {
    init(view:SplashViewController,model:SplashModel)
    func loadProtocols()
}
class SplashPresenter: SplashViewPresenter,SplashViewControllerDelegate {
    unowned let view:SplashViewController
    var model:SplashModel!
    required init(view: SplashViewController, model: SplashModel) {
       self.view = view
       self.model = model
    }
    func loadProtocols() {
        view.delegate = self
    }
    // MARK: - SplashViewcontrollerDelegate
    func goToLogIn() {
        
    }
}
