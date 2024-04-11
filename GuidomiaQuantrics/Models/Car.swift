//
//  Car.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation
import RealmSwift

class Car: Object {
    @Persisted var make: String
    @Persisted var model: String
    @Persisted var customerPrice: Double
    @Persisted var marketPrice:  Double
    @Persisted var prosList: List<String>
    @Persisted var consList: List<String>
    @Persisted var rating: Int
    @Persisted var imageName: String

}
