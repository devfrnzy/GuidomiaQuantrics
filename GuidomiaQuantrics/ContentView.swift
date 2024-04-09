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
        List {
            ForEach(vm.carViewModels) { carVM in
                CarItemView(carVM: carVM)
                .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                .listRowSpacing(20)
            }
           
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
