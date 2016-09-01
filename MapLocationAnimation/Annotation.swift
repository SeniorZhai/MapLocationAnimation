//
//  Annotation.swift
//  MapLocationAnimation
//
//  Created by zhai on 16/9/1.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {

    let coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
}
