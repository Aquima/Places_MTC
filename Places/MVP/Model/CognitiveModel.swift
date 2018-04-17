//
//  CognitiveModel.swift
//  Places
//
//  Created by NARA on 4/16/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CognitiveModel: NSObject {
    func postUrlImage(){
        let params = ["url":"http://67.205.176.58/billetes/billone.png"]
        
        let headers = ["Ocp-Apim-Subscription-Key":"0052893dcda844bf8415b46e536fa526",
                       "Content-Type":"application/json"]
      
        Alamofire.request(Preferences.WebUrl.urlCognitiveApi + "/ocr?language=unk&detectOrientation=true", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: {response in
            
        })
    }
}
