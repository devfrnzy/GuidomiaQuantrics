//
//  FilterPickerSheet.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/11/24.
//

import SwiftUI

struct FilterPickerSheet: View {
    
    @Binding var isPresented: Bool
    @Binding var selectedOption: String
    @State var options: [String]
    
    var body: some View {
        VStack {
            Picker(selection: $selectedOption, label: Text("Options")) {
                ForEach(options, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
        }.frame(maxWidth: .infinity)
    }
}
