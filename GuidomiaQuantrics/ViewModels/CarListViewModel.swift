//
//  CarListViewModel.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation

/// Decodes the JSON file to create Car objects
/// Creates an array of CarViewModel based on the generated Car objects from the JSON file
class CarListViewModel: ObservableObject {
    
    @Published var carViewModels: [CarViewModel] = []
    @Published var carModelNames = [String: Set<String>]()
    
    var expandedCarVM: CarViewModel?
    private let fileName = "car_list"
    private var cars: [Car] = []
    
    init() {
        decodeCarsJSON()
        processCars()
    }
    
    /// Decodes the JSON file to an array of Car
    func decodeCarsJSON() {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("DEBUG: JSON file:\(fileName).json not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            self.cars = try JSONDecoder().decode([Car].self, from: data)
        } catch {
            print("DEBUG: Error has occured - \(error.localizedDescription)")
        }
    }
    
    
    /// Generates an array of CarViewModel and the dictionary of carModelNames
    func processCars() {
        var carVMs = [CarViewModel]()
        for car in cars {
            let carVM = CarViewModel(car: car)
            carVMs.append(carVM)
            
            // Collect available make/model
            if var modelNames = carModelNames[car.make] {
                modelNames.insert(car.model)
                carModelNames[car.make] = modelNames
            } else {
                carModelNames[car.make] = [car.model]
            }
        }
        
        carViewModels = carVMs
        expand(carVM: carViewModels[0])
    }
    
    /// Expands or Collapses the CarViewModel depending on its current status
    func expandCollapse(carVM: CarViewModel) {
        if carVM.isExpanded {
            collapse()
        } else {
            expand(carVM: carVM)
        }
    }
    
    /// Collapses the current Expanded CarVM if any, then expands the passed carVM
    private func expand(carVM: CarViewModel) {
        // Collapse current expanded if any to make sure only 1 CarVM can be expanded at a time
        collapse()
        carVM.isExpanded = true
        expandedCarVM = carVM
    }

    /// Collapses the current Expanded CarVM
    private func collapse() {
        expandedCarVM?.isExpanded = false
        expandedCarVM = nil
    }
   
}
