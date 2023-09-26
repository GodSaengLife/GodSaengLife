//
//  NotificationManager.swift
//  GodSaengLife
//
//  Created by Jongbum Lee on 2023/09/25.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    private init() {}
    
    func scheduleNotification(at date: Date) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "알람"
        content.body = "알람"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarm1.mp3"))
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(identifier: "TEST", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Repeating notification scheduled for \(components.hour!):\(components.minute!)")
            }
        }
    }
    
    func updateNotification(identifier: String, at date: Date) {
        cancelNotification(identifier: identifier)
        scheduleNotification(at: date)
    }
    
    func cancelNotification(identifier: String) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}

