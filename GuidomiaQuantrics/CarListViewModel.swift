//
//  CarListViewModel.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation

class CarListViewModel: ObservableObject {
    
    @Published var carViewModels: [CarViewModel] = []
    
    private let fileName = "car_list"
    private var cars: [Car] = []
    
    init() {
        decodeCarsJSON()
        createCarViewModels()
    }
    
    func decodeCarsJSON() {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("DEBUG: JSON file:\(fileName).json not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            self.cars = try JSONDecoder().decode([Car].self, from: data)
            print(self.cars)
        } catch {
            print("DEBUG: Error has occured - \(error.localizedDescription)")
        }
    }
    
    func createCarViewModels() {
        var carVMs = [CarViewModel]()
        for car in cars {
            let carVM = CarViewModel(car: car)
            carVMs.append(carVM)
        }
        
        carViewModels = carVMs
    }
    
}
