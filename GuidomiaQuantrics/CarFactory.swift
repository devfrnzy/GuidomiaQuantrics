//
//  CarFactory.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/11/24.
//

import Foundation
import RealmSwift

class CarFactory {
    
    enum Properties: String {
        case make, model, customerPrice, marketPrice, prosList, consList, rating, imageName
        
    }
   
    enum CarInitializationError: Error {
        case missingProperty(String)
    }
    
    class func createCar(from dictionary: [String: Any]) throws -> Car {
        guard let make = dictionary[Properties.make.rawValue] as? String else {
            throw CarInitializationError.missingProperty(Properties.make.rawValue)
        }
        guard let model = dictionary[Properties.model.rawValue] as? String else {
            throw CarInitializationError.missingProperty(Properties.model.rawValue)
        }
        guard let customerPrice = dictionary[Properties.customerPrice.rawValue] as? Double else {
            throw CarInitializationError.missingProperty(Properties.customerPrice.rawValue)
        }
        guard let marketPrice = dictionary[Properties.marketPrice.rawValue] as? Double else {
            throw CarInitializationError.missingProperty(Properties.marketPrice.rawValue)
        }
        guard let prosList = dictionary[Properties.prosList.rawValue] as? [String] else {
            throw CarInitializationError.missingProperty(Properties.prosList.rawValue)
        }
        guard let consList = dictionary[Properties.consList.rawValue] as? [String] else {
            throw CarInitializationError.missingProperty(Properties.consList.rawValue)
        }
        guard let rating = dictionary[Properties.rating.rawValue] as? Int else {
            throw CarInitializationError.missingProperty(Properties.rating.rawValue)
        }
        guard let imageName = dictionary[Properties.imageName.rawValue] as? String else {
            throw CarInitializationError.missingProperty(Properties.imageName.rawValue)
        }
        
        let car = Car()
        car.make = make
        car.model = model
        car.customerPrice = customerPrice
        car.marketPrice = marketPrice
        
        let pros = List<String>()
        pros.append(objectsIn: prosList)
        car.prosList = pros
        
        let cons = List<String>()
        cons.append(objectsIn: consList)
        car.consList = cons
        
        car.rating = rating
        car.imageName = imageName
        
        return car
    }
    
}
