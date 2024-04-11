//
//  ContentView.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = CarListViewModel()
    @State var isMakeFilterPresented = false
    @State var isModelFilterPresented = false

    var body: some View {
        ScrollView {
            LazyVStack {
                filterSectionView
                    .padding(.horizontal)
                
                ForEach(vm.filteredCarViewModels) { carVM in
                    VStack(spacing: 0) {
                        CarItemView(carVM: carVM)
                            .onTapGesture {
                                withAnimation {
                                    vm.expandCollapse(carVM: carVM)
                                }
                            }
                        
                        // Custom Separator
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(.themeOrange)
                            .padding()
                    }
                    
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
            }
        }
        
    }
    
    var filterSectionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Filters")
                .font(.title2)
                .foregroundStyle(.white)
            
            VStack(spacing: 15) {
                
                // Make Filter
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                        .frame(height: 35)
                        .shadow(radius: 2, x: 1, y: 1)
                    HStack {
                        Text("\(vm.selectedMakeFilter)")
                            .bold()
                            .foregroundStyle(.themeText)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .onTapGesture {
                    isMakeFilterPresented = true
                }
                .sheet(isPresented: $isMakeFilterPresented) {
                    FilterPickerSheet(isPresented: $isMakeFilterPresented, selectedOption: $vm.selectedMakeFilter, options: vm.carMakeFilterChoices)
                        .presentationDetents([.height(150)])
                }
                
                // Model Filter
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                        .frame(height: 35)
                        .shadow(radius: 2, x: 1, y: 1)
                    HStack {
                        Text("\(vm.selectedModelNameFilter)")
                            .bold()
                            .foregroundStyle(.themeText)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .onTapGesture {
                    isModelFilterPresented = true
                }
                .sheet(isPresented: $isModelFilterPresented) {
                    FilterPickerSheet(isPresented: $isModelFilterPresented, selectedOption: $vm.selectedModelNameFilter, options: vm.carModelNameFilterChoices)
                        .presentationDetents([.height(150)])
                }
            }
            
        }
        .padding(EdgeInsets(top: 8, leading: 12, bottom: 20, trailing: 12))
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.themeDarkGray)
        }
    }

}

#Preview {
    ContentView()
}
