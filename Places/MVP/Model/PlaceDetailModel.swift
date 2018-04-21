//
//  PlaceDetailModel.swift
//  Places
//
//  Created by NARA on 4/16/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
protocol PlaceDetailModelDelegate {
    func completesDetailDepartments(detail:DepartmentDetail)
}
class PlaceDetailModel: NSObject {
    var delegate:PlaceDetailModelDelegate?
    var department:Department!
    func getDetailDepartment(department:Department){
        let headers = [
            "content-type": "application/json"
        ]
        let method = "/\(department.id).json"
        
        Alamofire.request(Preferences.WebUrl.urlBase + method,headers:headers).responseJSON { (responseObject) -> Void in
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                let detail:DepartmentDetail = DepartmentDetail(object: resJson)
                self.delegate?.completesDetailDepartments(detail: detail)
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error! as NSError
                print("\(error.description)")
        
            }
        }
      
    }
}
