//
//  StepperBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 20.12.2022.
//

import SwiftUI

struct StepperBootcamp: View {
    @State private var stepperValue = 10
    @State private var widthIncrement = 0.0
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            Stepper("Stepper 2") {
               incrementWidth(amount: 10)
            } onDecrement: {
               incrementWidth(amount: -10)
            }

        }
    }
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
