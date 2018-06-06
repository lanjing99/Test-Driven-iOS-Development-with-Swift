//
//  *@项目名称:  ToDo
//  *@文件名称:  Location.swift
//  *@Date 2018/6/6
//  *@Author lanjing
//

import Foundation
import CoreLocation

struct Location : Equatable {
    let name: String
    let cordinate: CLLocationCoordinate2D?
    
    init(name: String, cordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.cordinate = cordinate
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        
        if lhs.cordinate?.latitude != rhs.cordinate?.latitude {
            return false
        }
        
        if lhs.cordinate?.longitude != rhs.cordinate?.longitude {
            return false
        }
        
        return true
    }
}
