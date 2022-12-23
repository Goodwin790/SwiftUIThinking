//
//  BackgroundAndOverlayBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
            Circle()
                .fill(
                    AngularGradient(colors: [.blue, .green, .red], center: .bottomTrailing, angle: .degrees(333))
                )
                .frame(width: 100, height: 100)
                .shadow(color: .green.opacity(0.2), radius: 10, x: 0, y: 10)
                .overlay(
                    Circle()
                        .fill(.blue)
                        .frame(width: 35, height: 35)
                        .overlay(
                            Text("5")
                                .font(.headline)
                                .foregroundColor(.white)
                                )
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                    , alignment: .bottomTrailing)
            )
    }
}

struct BackgroundAndOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlayBootcamp()
    }
}
