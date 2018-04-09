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
class SplashPresenter: SplashViewPresenter {
    
    required init(view: SplashViewController, model: SplashModel) {
        
    }
    func loadProtocols() {
        
    }
}
