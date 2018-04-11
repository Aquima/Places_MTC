//
//  LogInPresenter.swift
//  Places
//
//  Created by NARA on 4/10/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol LogInViewPresenter {
    init(view:LogInViewController,model:AuthenticateModel)
    func loadProtocols()
}
class LogInPresenter: LogInViewPresenter,LogInViewControllerDelegate,AuthenticateModelDelegate {

    unowned let view:LogInViewController
    var model:AuthenticateModel
    required init(view: LogInViewController, model: AuthenticateModel) {
        self.view = view
        self.model = model
    }
    func loadProtocols() {
        self.view.delegate = self
        self.model.delegate = self
    }
    // MARK:LogInViewControllerDelegate
    func validateInputs(inputs: [InputTextField]) {
        self.model.validateInputs(inputs: inputs)
    }
    func validateInput(input: InputTextField) {
        self.model.validateInput(input: input)
    }
    func showHome() {
        self.view.goToHome()
    }
}
