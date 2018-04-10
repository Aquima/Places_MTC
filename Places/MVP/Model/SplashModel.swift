//
//  SplashModel.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit

class SplashModel: NSObject {
    func loadLogin(view:SplashViewController){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let viewLogIn:LogInViewController = LogInViewController()
            view.navigationController?.pushViewController(viewLogIn, animated: false)
        }
    }
}
