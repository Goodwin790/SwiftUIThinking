//
//  LocalNotificationBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 25.01.2023.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This was soooo easy"
        content.sound = .default
        content.badge = 1
        
        //time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //calendar
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 14
//        dateComponents.minute = 03
//        dateComponents.weekday = 4
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //location
        let coordinates = CLLocationCoordinate2D(latitude: 40, longitude: 44)
        let region = CLCircularRegion(center: coordinates,radius: 100,
 identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack( spacing: 40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel notification") {
                NotificationManager.instance.cancelNotification()
            }
            
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
