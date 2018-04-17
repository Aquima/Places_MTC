//
//  PlaceDetailModel.swift
//  Places
//
//  Created by NARA on 4/16/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol PlaceDetailModelDelegate {
    
}
class PlaceDetailModel: NSObject {
    var delegate:PlaceDetailModelDelegate?
    var department:Department!
}
