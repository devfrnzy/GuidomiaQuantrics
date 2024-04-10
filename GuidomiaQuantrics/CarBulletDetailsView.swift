//
//  CarBulletDetailsView.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/11/24.
//

import SwiftUI

/// Displays a title and a bulleted list based on the given items.
struct CarBulletDetailsView: View {
    
    @State var title: String
    @State var bulletItems: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title) :")
                .font(.title3)
                .bold()
                .foregroundStyle(.themeText)
            
            ForEach(bulletItems, id:\.self) { detail in
                HStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.themeOrange)
                    Text("\(detail)")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                }
                .padding(.leading)
            }
        }
    }
}

#Preview {
    CarBulletDetailsView(title: "Pros", bulletItems: ["Test Detail"])
}
