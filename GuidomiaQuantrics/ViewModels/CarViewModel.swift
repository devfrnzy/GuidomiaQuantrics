//
//  CarViewModel.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation

class CarViewModel: ObservableObject {
    
    @Published var isExpanded = false
    private let car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var make: String {
        return car.make
    }
    
    var model: String {
        return car.model
    }
    
    var imageName: String {
        return car.imageName
    }
    
    var price: String {
        let priceInThousands = car.marketPrice/1000
        return "\(priceInThousands.cleanString)K"
    }
    
    var rating: Int {
        return car.rating
    }
    
    var pros: [String] {
        return Array(car.prosList)
    }
    
    var cons: [String] {
        return Array(car.consList)
    }
}

/// Conform to Identifiable and Hashable in order for us to use it on a Foreach loop
extension CarViewModel: Identifiable, Hashable {
    var identifier: String {
        return UUID().uuidString
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
    public static func == (lhs: CarViewModel, rhs: CarViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
