//
//  TimerBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 09.02.2023.
//

import SwiftUI

struct TimerBootcamp: View {
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    //CCurrent time
    /*
    @State private var currentDate = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
      //  formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    //Countdown
    /*
    @State private var count = 10
    @State private var finishedText: String? = nil
    */
    
    //Countdown to date
    /*
    @State private var timeRemaining = ""
    
    let futureDate: Date  = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    */
    
    //Animation counter
    
    @State private var count = 1
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.yellow)
                    .tag(1)
            }
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }

        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
