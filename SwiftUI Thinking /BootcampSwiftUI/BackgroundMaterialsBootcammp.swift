//
//  BackgroundMaterialsBootcammp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 23.12.2022.
//

import SwiftUI

struct BackgroundMaterialsBootcammp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
        Image("Example")
        )
    }
}

struct BackgroundMaterialsBootcammp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsBootcammp()
    }
}
