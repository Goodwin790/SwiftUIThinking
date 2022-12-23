//
//  SliderBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 20.12.2022.
//

import SwiftUI

struct SliderBootcamp: View {
    @State private var sliderValue = 10.0
    @State private var color = Color.red
    
    var body: some View {
        VStack {
            Text("Rating")
            Text(
                String.init(format: "%.1f", sliderValue)
               // "\(sliderValue)"
            )
            .foregroundColor(color)
            //Slider(value: $sliderValue)
           // Slider(value: $sliderValue, in: 0...100)
           // Slider(value: $sliderValue, in: 1...5, step: 1.0)
            Slider(value: $sliderValue,
                   in: 1...5,
                   step: 1.0,
                   onEditingChanged: { _ in
                color = .green
            },
                   minimumValueLabel:
                    Text("1")
                .font(.largeTitle)
                .foregroundColor(.orange)
                   ,
                   maximumValueLabel:
                    Text("2")
                .font(.largeTitle)
                .foregroundColor(.orange)
                   ,
                   label: {
                Text("Title")
            })
                .accentColor(.red)
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
