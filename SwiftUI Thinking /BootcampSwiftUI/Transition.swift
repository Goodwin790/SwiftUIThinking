//
//  Transition.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct Transition: View {
    @State private var showView = false
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Button") {
                    showView.toggle()
                }
                Spacer()
                
            }
            if showView {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: UIScreen.main.bounds.height / 2)
                .transition(.asymmetric(
                    insertion: .move(edge: .bottom),
                    removal: AnyTransition.opacity.animation(.easeInOut(duration: 10))
                ))
                .animation(.easeInOut)
            }
        }
        .ignoresSafeArea( edges: .bottom)
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
