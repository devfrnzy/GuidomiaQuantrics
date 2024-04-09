//
//  CarItemView.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import SwiftUI

/// Shows the details of a Car
struct CarItemView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("Alpine_roadster")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .padding(.leading)
            VStack(alignment: .leading) {
                Text("Mercedes benz")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.themeText)
                Text("Price: 120k")
                    .bold()
                    .foregroundStyle(.themeText)
                HStack {
                    ForEach(1..<6) { number in
                        Image(systemName: "star.fill")
                            .foregroundColor(.themeOrange)
                    }
                }
                .padding(.vertical, 5)
            }
            Spacer()
        }
        .padding(.leading, 5)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(.themeLightGray)
    }
}

#Preview {
    CarItemView()
}
