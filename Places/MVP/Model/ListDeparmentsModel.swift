//
//  ListDeparmentsModel.swift
//  Places
//
//  Created by NARA on 4/12/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol ListDeparmentsModelDelegate {
    func completesDepartments(departments:[Department])
}
class ListDeparmentsModel: NSObject {
    var delegate:ListDeparmentsModelDelegate?
    func getDepartments(){
        let headers = [
            "content-type": "application/json"
        ]
        let method = "/departments.json"
        Alamofire.request(Preferences.WebUrl.urlBase + method,headers:headers).responseJSON { (responseObject) -> Void in
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                var list:[Department] = [Department]()
                for item:JSON in resJson["departments"].array!{
                    let newDepartment:Department = Department(object: item)
                    list.append(newDepartment)
                }
                self.delegate?.completesDepartments(departments: list)
//                if resJson["isValide"].bool ==  true {
//                    self.delegate?.completeVideoUrl(url: resJson["link"].string!)
//                }else{
//                    self.delegate?.showLogIn()
//                }
                
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error! as NSError
                print("\(error.description)")
//                self.delegate?.showLogIn()
                
            }
        }
    }
}
