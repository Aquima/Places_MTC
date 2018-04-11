//
//  SplashModel.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol SplashModelDelegate {
    func showLogIn()
}
class SplashModel: NSObject {
    var delegate:SplashModelDelegate?
    func loadLogin(view:SplashViewController){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate?.showLogIn()
        }
    }
}
