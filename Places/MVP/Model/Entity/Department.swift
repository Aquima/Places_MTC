//
//  Department.swift
//  Places
//
//  Created by NARA on 4/12/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import SwiftyJSON

class Department: NSObject {
    var title:String = ""
    var imgUrl:String = ""
    var date:Date = Date()//dd/mm/yyyy
    var lema:String = ""
    var id:String = ""
    init(object:JSON){
        self.title = object["title"].string!
        self.imgUrl = object["imgUrl"].string!
        self.lema = object["lema"].string!
        self.id = object["id"].string!
    }
}
