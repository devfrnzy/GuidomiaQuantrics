//
//  ContentView.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = CarListViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(vm.carViewModels) { carVM in
                    VStack(spacing: 0) {
                        CarItemView(carVM: carVM)
                            .background(.red)
                        
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
}

#Preview {
    ContentView()
}
