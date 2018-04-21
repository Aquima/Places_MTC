//
//  ShapeMap.swift
//  Places
//
//  Created by NARA on 4/20/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import MapKit
class ShapeMap:NSObject,MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate:CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
