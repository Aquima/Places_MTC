//
//  LogInViewController.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol LogInViewControllerDelegate {
    func validateInput(input:InputTextField)
    func validateInputs(inputs:[InputTextField])
}
class LogInViewController: BaseViewController,UITextFieldDelegate {
    static let tableName = "LogIn"
    var delegate:LogInViewControllerDelegate?
    var listInputText:Array = [InputTextField]()
    var inputEmailText:InputTextField = InputTextField()
    var inpuPasswordText:InputTextField = InputTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.drawBody()
    }
    func drawBody(){
     //   186 117
        // img logo
        let img:UIImageView = UIImageView()
        img.image = #imageLiteral(resourceName: "logMtc")
        img.frame = CGRect(x: (self.view.frame.size.width - 186)/2, y:  32, width: 186, height: 117)
        self.view.addSubview(img)
 
        inputEmailText.tintColor = .orange
        inputEmailText.frame = CGRect(x: (self.view.frame.size.width - 240)/2, y: 380, width: 240 , height: 25)
        inputEmailText.textAlignment = .left
        inputEmailText.withPlaceHolderGray(placeHolder: Preferences.LogIn.PlaceHolderEmail.localizedFromTable(tableName: LogInViewController.tableName), valuePro: 1, view: self.view)
        inputEmailText.keyboardType = .emailAddress
        inputEmailText.delegate = self
        inputEmailText.inputType = .email
        inputEmailText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        listInputText.append(inputEmailText)
        
        inpuPasswordText.tintColor = .orange
        inpuPasswordText.frame = CGRect(x: (self.view.frame.size.width - 240)/2, y: 432, width: 240 , height: 25)
        inpuPasswordText.textAlignment = .left
        inpuPasswordText.withPlaceHolderGray(placeHolder: Preferences.LogIn.PlaceHolderPassword.localizedFromTable(tableName: LogInViewController.tableName), valuePro: 1, view: self.view)
        inpuPasswordText.keyboardType = .default
        inpuPasswordText.delegate = self
        inpuPasswordText.isSecureTextEntry = true
        inpuPasswordText.inputType = .password
        inpuPasswordText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        listInputText.append(inpuPasswordText)
        
        let btnEnter:UIButton = UIButton()
        btnEnter.frame = CGRect(x:(self.view.frame.size.width - 233)/2, y: 481, width: 233, height: 40.0)
        btnEnter.layer.cornerRadius = 3
        btnEnter.layer.masksToBounds = true
        btnEnter.backgroundColor = UIColor.init(hexString: Styles.color.red)
        btnEnter.titleLabel?.font =  UIFont(name: Styles.fonts.trajan, size: 14.5)
        btnEnter.setTitle(Preferences.LogIn.BtnTitleEnter.localizedFromTable(tableName: LogInViewController.tableName), for: .normal)
        btnEnter.setTitleColor(UIColor.white, for: .normal)
        btnEnter.addTarget(self, action: #selector(self.validateInputs(sender:)), for: .touchUpInside)
        self.view.addSubview(btnEnter)
        
    }
    @IBAction func validateInputs(sender:UIButton){
        self.delegate?.validateInputs(inputs: listInputText)
    }
    @IBAction func textFieldDidChange(_ texfield:InputTextField){
        print("\(texfield.text!)")
        self.delegate?.validateInput(input: texfield)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func goToHome(){
        //cargar la vista de home
        let model:ListDeparmentsModel = ListDeparmentsModel()
        let view:ListDepartmentsViewController = ListDepartmentsViewController()
        let presenter = ListDepartmentPresenter(view: view, model: model)
        presenter.loadProtocols()
        self.navigationController?.pushViewController(view, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
