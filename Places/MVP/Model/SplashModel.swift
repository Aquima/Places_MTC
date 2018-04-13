//
//  SplashModel.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol SplashModelDelegate {
    func showLogIn()
    func completeVideoUrl(url:String)
}
class SplashModel: NSObject {
    var delegate:SplashModelDelegate?
    func loadLogin(view:SplashViewController){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.delegate?.showLogIn()
//        }
    }
    func getVideo(){
        let headers = [
            "content-type": "application/json"
        ]
        let method = "/getVideo.json"
        Alamofire.request(Preferences.WebUrl.urlBase + method,headers:headers).responseJSON { (responseObject) -> Void in
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                if resJson["isValide"].bool ==  true {
                    self.delegate?.completeVideoUrl(url: resJson["link"].string!)
                }else{
                    self.delegate?.showLogIn()
                }
                
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error! as NSError
                print("\(error.description)")
                    self.delegate?.showLogIn()
                
            }
        }
    }
}
