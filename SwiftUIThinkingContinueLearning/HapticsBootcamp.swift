//
//  HapticsBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 25.01.2023.
//

import SwiftUI

class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Divider()
            Button("soft") { HapticManager.instance.impact(style: .soft) }
            Button("rigid") { HapticManager.instance.impact(style: .rigid) }
            Button("medium") { HapticManager.instance.impact(style: .medium) }
            Button("light") { HapticManager.instance.impact(style: .light) }
            Button("heavy") { HapticManager.instance.impact(style: .heavy) }
        }
    }
}

struct HapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootcamp()
    }
}
