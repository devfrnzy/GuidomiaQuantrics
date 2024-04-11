//
//  CarDataPreloader.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/11/24.
//

import Foundation

class CarDataPreloader {
    
    class func preloadCarJSONData() {
        guard RealmManager.shared.getAllObjects(Car.self).count == 0 else {
            return
        }
        
        
        let filename = "car_list"
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("DEBUG: JSON file:\(filename).json not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
                print("DEBUG: Unable to parse JSON data to [[String: Any]]")
                return
            }
            
            for dictionary in jsonArray {
                let car = try Car(dictionary: dictionary)
                RealmManager.shared.addObject(car)
            }
        } catch {
            print("DEBUG: Error has occured - \(error.localizedDescription)")
        }
    }
    
}
