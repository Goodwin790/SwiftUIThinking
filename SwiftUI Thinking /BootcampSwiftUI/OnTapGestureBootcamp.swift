//
//  OnTapGestureBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

struct OnTapGestureBootcamp: View {
    @State private var backgroundColor = Color.blue
    @State private var isSelected = false
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(25)
            }
            Text("Tap gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
Spacer()
        }
        .padding(40)
    }
}

struct OnTapGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnTapGestureBootcamp()
    }
}
