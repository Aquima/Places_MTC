//
//  InputTextField.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
enum TextFieldTypes {
    case email
    case password
    case none
}
class InputTextField: UITextField {
    var inputType:TextFieldTypes = .none
    public var paddingBottom:UIView = UIView()
    func withPlaceHolderGray(placeHolder:String,valuePro:CGFloat,view:UIView) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                        attributes: [NSAttributedStringKey.foregroundColor: UIColor.init(hexString: Styles.color.gray)])
        self.textColor = UIColor.init(hexString: Styles.color.black)
        self.clearButtonMode = .always
        self.autocorrectionType = .no
        self.font = UIFont(name: Styles.fonts.regular, size: 12.5*valuePro)
//
        let contentPassword:UIView = UIView(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height + 12*valuePro))
        contentPassword.backgroundColor = UIColor.clear
        contentPassword.layer.cornerRadius = 2*valuePro
        view.addSubview(contentPassword)
//
      //  contentPassword.addSubview(lblSuggest)
        self.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        contentPassword.addSubview(self)
        self.backgroundColor = .clear
//
        paddingBottom.frame = CGRect(x: 0 , y: (self.frame.origin.y + self.frame.size.height), width: self.frame.size.width, height: 1*valuePro)
        paddingBottom.backgroundColor = UIColor.init(hexString: Styles.color.gray)
        contentPassword.addSubview(paddingBottom)
//
//        lblSuggest.frame = CGRect(x: 0, y: paddingBottom.frame.origin.y, width: paddingBottom.frame.size.width, height: 12*valuePro)
//        lblSuggest.textColor = .red
//        lblSuggest.font = UIFont(name: Styles.font.Light, size: 10*valuePro)
        
    }
}
