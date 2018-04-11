//
//  AuthenticateModel.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol AuthenticateModelDelegate {
    func showHome()
}
class AuthenticateModel: NSObject {
    var delegate:AuthenticateModelDelegate?
    func validateInputs(inputs:[InputTextField]){
        var list:[Bool] = [Bool]()
        for input in inputs {
            if input.inputType == .password {
                list.append(self.validatePassword(input: input))
            }else if input.inputType == .email {
                list.append(self.validateEmail(input: input))
            }
        }
        var confirm:Bool = true
        for validate in list {
            if validate == false{
                confirm = false
            }
        }
        if confirm == true {
            //me voy a home
            self.delegate?.showHome()
        }
    }
    func validateInput(input:InputTextField){
        var confirm:Bool = false
        if input.inputType == .email {
            //validar email
           confirm = self.validateEmail(input: input)
            
        }else if input.inputType == .password {
            //validar el password
            confirm = self.validatePassword(input: input)
        }
        print(confirm)
    }

    private func validateEmail(input:InputTextField) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: input.text!) {
            input.paddingBottom.backgroundColor = UIColor.init(hexString: Styles.color.gray)
            return true
        }else{
            input.paddingBottom.backgroundColor = .red
            return false
        }
    }
    private func validatePassword(input:InputTextField) -> Bool{
        if (input.text?.isEmpty)! {
            input.paddingBottom.backgroundColor = .red
            return false
        }else{
            input.paddingBottom.backgroundColor = UIColor.init(hexString: Styles.color.gray)
            return true
        }
    }
}
