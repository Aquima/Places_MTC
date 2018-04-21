//
//  DepartmentDetail.swift
//  Places
//
//  Created by NARA on 4/20/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Coordinate {
    let lat:Double
    let lng:Double
    init(lat:Double,lng:Double) {
        self.lat = lat
        self.lng = lng
    }
}
class DepartmentDetail: NSObject {
    var coordinate:Coordinate!
    var detail:String!
    var shape = [Coordinate]()
    init(object:JSON) {
        detail = object["detail"].string!
        
        coordinate = Coordinate(lat: object["coordinate"]["latitude"].double!, lng: object["coordinate"]["longitude"].double!)
        
        for crdt in object["shape"].array! {
            let newCorrdinate = Coordinate(lat: crdt["latitude"].double!, lng: crdt["longitude"].double!)
            shape.append(newCorrdinate)
        }
        
    }
}
