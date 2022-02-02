//
//  Course.swift
//  Courses
//
//  Created by Esther Alcoceba Gutiérrez de León on 2/2/22.
//

import Foundation

struct Course: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var pricelevel: Int
    var featured = false
    var purchased = false
}
