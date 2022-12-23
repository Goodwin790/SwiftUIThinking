//
//  PopOver.swift
//  0AddingText
//
//  Created by Сергей Киров on 17.12.2022.
//

import SwiftUI

struct PopOver: View {
    @State private var showNewScreen = false
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack{
                Button("Button") {
                    showNewScreen.toggle()
                }
                Spacer()
            }
            //Method 1 Sheet
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            
            //Method 2 Transition
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2)
            
            //Method 3 Animation offset
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 100)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
        }
    }
}

struct NewScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea()
            
            Button(action: {
           //     dismiss()
                showNewScreen.toggle()
            },
                   label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            })
        }
    }
}

struct PopOver_Previews: PreviewProvider {
    static var previews: some View {
        PopOver()
       // NewScreen()
    }
}
