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
 
    // MARK: - Enums
    
    enum FilterConstants: String {
        case make = "Any make"
        case model = "Any model"
    }
    
    // MARK: - Published Properties
    
    @Published var filteredCarViewModels: [CarViewModel] = []
    @Published var carModelNames = [String: Set<String>]()
    
    
    // MARK: - Filter-related Properties
    
    @Published var selectedMakeFilter: String = FilterConstants.make.rawValue {
        didSet {
            selectedModelNameFilter = FilterConstants.model.rawValue
            filterCars()
        }
    }
    @Published var selectedModelNameFilter: String = FilterConstants.model.rawValue {
        didSet {
            filterCars()
        }
    }
    
    var carMakeFilterChoices: [String] {
        var carMakes = [FilterConstants.make.rawValue]
        carMakes.append(contentsOf: Array(carModelNames.keys))
        return carMakes
    }
    
    var carModelNameFilterChoices: [String] {
        var modelNames = [FilterConstants.model.rawValue]
        if let carModelNamesByMake = carModelNames[selectedMakeFilter] {
            modelNames.append(contentsOf: carModelNamesByMake)
        }
        return modelNames
    }
    
    // MARK: - Private Properties
    
    private let fileName = "car_list"
    private var carViewModels: [CarViewModel] = []
    private var cars: [Car] = []
    private var expandedCarVM: CarViewModel?
    
    init() {
        decodeCarsJSON()
        processCars()
    }
    
    /// Filter cars based on current makeFIlter and modelFilter
    func filterCars() {
        filteredCarViewModels = carViewModels.filter{
            let modelContainsFilter = $0.model == selectedModelNameFilter || selectedModelNameFilter == FilterConstants.model.rawValue
            let makeContainsFilter = $0.make == selectedMakeFilter || selectedMakeFilter == FilterConstants.make.rawValue
            return modelContainsFilter && makeContainsFilter
        }
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
        filteredCarViewModels = carViewModels
        expand(carVM: filteredCarViewModels[0])
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
