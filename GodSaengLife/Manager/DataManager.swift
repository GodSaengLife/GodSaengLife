//
//  DataManager.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//

import UIKit

final class DataManager {
    static let shared = DataManager()
    private let userDefaults = UserDefaults.standard
    private let alarmInfo = AlarmInfo()
    private let exerciseInfo = ExerciseInfo()
    
    enum Key: String {
        case alarmInfo
        case studyInfo
        case exerciseInfo
    }
    
    private init() {}
    
    // MARK: - Get
    func getAlarmInfo() -> AlarmInfo {
        return self.alarmInfo
    }
    
    func getExerciseInfo() -> ExerciseInfo? {
        if let data = userDefaults.data(forKey: Key.exerciseInfo.rawValue) {
            do {
                let decoder = JSONDecoder()
                let exerciseInfo = try decoder.decode(ExerciseInfo.self, from: data)
                return exerciseInfo
            } catch {
                print("ERROR: Get ExerciseInfo Failed")
            }
        }
        return nil
    }
    
    func getStudyInfo() -> StudyInfo? {
        if let data = userDefaults.data(forKey: Key.studyInfo.rawValue) {
            do {
                let decoder = JSONDecoder()
                let studyInfo = try decoder.decode(StudyInfo.self, from: data)
                return studyInfo
            } catch {
                print("ERROR: Get StudyInfo Failed")
            }
        }
        return nil
    }
    
    // MARK: - Create
    func create(_ exerciseInfo: ExerciseInfo) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(exerciseInfo)
            userDefaults.set(data, forKey: Key.exerciseInfo.rawValue)
        } catch {
            print("ERROR: Create ExerciseInfo Failed")
        }
    }
    
    func create(_ studyInfo: StudyInfo) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(studyInfo)
            userDefaults.set(data, forKey: Key.studyInfo.rawValue)
        } catch {
            print("ERROR: Create StudyInfo Failed")
        }
    }
    
    // MARK: - Update
    private func updateUserDefautls(_ exerciseInfo: ExerciseInfo?) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(exerciseInfo) {
            userDefaults.set(data, forKey: Key.exerciseInfo.rawValue)
        }
    }
    
    private func updateUserDefautls(_ studyInfo: StudyInfo?) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(studyInfo) {
            userDefaults.set(data, forKey: Key.studyInfo.rawValue)
        }
    }
    
    func updateWakeUpTime(alarmInfo: AlarmInfo) {
        self.alarmInfo.wakeUpTime = alarmInfo.wakeUpTime
    }
    
    func update(_ exerciseInfo: ExerciseInfo?) {
        updateUserDefautls(exerciseInfo)
    }
    
    func update(_ studyInfo: StudyInfo?) {
        updateUserDefautls(studyInfo)
    }

    func convertTime(toSeconds: Int?) -> (Int, Int, Int) {
        guard let seconds = toSeconds else { return (0, 0, 0) }
        let hour = seconds / 3600
        let minute = (seconds % 3600) / 60
        let second = (seconds % 3600) % 60
        return (hour, minute, second)
    }
    
    func convertSeconds(toHour: Int, toMinute: Int, toSeconds: Int) -> Int {
        let seconds = (toHour * 3600) + (toMinute * 60) + toSeconds
        return seconds
    }
}
