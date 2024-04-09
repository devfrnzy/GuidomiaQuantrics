//
//  Car.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation

struct Car: Codable {
    var make: String
    var model: String
    var customerPrice: Double
    var marketPrice:  Double
    var prosList: [String]
    var consList: [String]
    var rating: Int
    var imageName: String
}
