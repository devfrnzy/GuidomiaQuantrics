//
//  CarItemView.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import SwiftUI

/// Shows the details of a Car
struct CarItemView: View {
    @ObservedObject var carVM: CarViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(carVM.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .padding(.leading)
                    .fixedSize()
                VStack(alignment: .leading) {
                    Text(carVM.make)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.themeText)
                    Text("Price: \(carVM.price)")
                        .bold()
                        .foregroundStyle(.themeText)
                    HStack {
                        ForEach(0..<carVM.rating, id:\.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.themeOrange)
                        }
                    }
                    .padding(.vertical, 5)
                }
                Spacer()
            }
            
            VStack(alignment: .leading) {
                if !carVM.pros.isEmpty {
                    CarBulletDetailsView(title: "Pros", bulletItems: carVM.pros)
                }
                
                if !carVM.cons.isEmpty {
                    CarBulletDetailsView(title: "Cons", bulletItems: carVM.cons)
                    
                }
            }
            .padding()
        }
        .padding(.leading, 5)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(.themeLightGray)
    }
}
