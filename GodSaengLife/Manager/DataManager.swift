//
//  DataManager.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//

import UIKit

class DataManager {
    static let shared = DataManager()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private init() {}
    
    private func getAlarmInfo() -> [AlarmInfo] {
        do {
            let info = try self.context.fetch(AlarmInfo.fetchRequest())
            return info
        }
        catch {
        }
        return []
    }
    
    private func getStudyInfo() -> [StudyInfo] {
        do {
            let info = try self.context.fetch(StudyInfo.fetchRequest())
            return info
        }
        catch {
        }
        return []
    }
    
    private func getExerciseInfo() -> [ExerciseInfo] {
        do {
            let info = try self.context.fetch(ExerciseInfo.fetchRequest())
            return info
        }
        catch {
        }
        return []
    }
}
