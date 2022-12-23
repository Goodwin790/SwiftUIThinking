//
//  GradientsBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
       RoundedRectangle(cornerRadius: 25)
            .fill(
             //   .red
//                LinearGradient(
//                    colors: [.green, .orange, .purple, .pink,.yellow],
//                    startPoint: .topLeading,
//                    endPoint: .trailing)
                
//                RadialGradient(colors: [.red, .blue,.green, .orange, .purple, .pink,.yellow],
//                               center: .topLeading,
//                               startRadius: 6,
//                               endRadius: 300)
                
                AngularGradient(
                    gradient: Gradient(colors: [.red, .blue,.green]),
                    center: .topLeading,
                    angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
    }
}

struct GradientsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientsBootcamp()
    }
}
