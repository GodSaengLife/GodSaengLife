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
    
    func scheduleNotification(at date: Date, title: String, body: String, soundName: String = "alarm1.mp3", identifier: String) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: soundName))
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Repeating notification scheduled for \(components.hour!):\(components.minute!) with identifier: \(identifier)")
            }
        }
    }
    
    func scheduleImmediateNotification(title: String, body: String, identifier: String) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
        
        center.add(request) { (error) in
            if let error = error {
                print("Error scheduling immediate notification: \(error)")
            } else {
                print("Immediate notification scheduled!")
            }
        }
    }
    
    func updateNotification(identifier: String, at date: Date, title: String? = nil, body: String? = nil, soundName: String? = nil) {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { (requests) in
            if let requestToUpdate = requests.first(where: { $0.identifier == identifier }) {
                let updatedContent = requestToUpdate.content.mutableCopy() as! UNMutableNotificationContent
                
                if let title = title {
                    updatedContent.title = title
                }
                
                if let body = body {
                    updatedContent.body = body
                }
                
                if let soundName = soundName {
                    updatedContent.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: soundName))
                }
                
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                
                let updatedRequest = UNNotificationRequest(identifier: identifier, content: updatedContent, trigger: trigger)
                
                center.add(updatedRequest) { (error) in
                    if let error = error {
                        print("Error updating notification: \(error)")
                    } else {
                        print("Notification with identifier: \(identifier) updated.")
                    }
                }
            } else {
                print("Notification with identifier: \(identifier) not found.")
            }
        }
    }
    
    func cancelNotification(identifier: String) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}
