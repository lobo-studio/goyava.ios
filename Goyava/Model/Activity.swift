//
//  Activity.swift
//  Goyava
//
//  Created by Susim Samanta on 05/04/16.
//  Copyright © 2016 LordAlexWorks. All rights reserved.
//

import UIKit
import RealmSwift

class Activity: Object {
    dynamic var createdAt = 1467345810.0
    dynamic var point = 0
    
    func setModelData(_ dict : NSDictionary) {
        //self.createdAt = dict["created_at"] as! Double
        self.point = dict["point"] as! Int
    }
}
