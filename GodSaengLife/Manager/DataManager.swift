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
    
    enum Key: String {
        case alarmInfo
        case studyInfo
        case exerciseInfo
    }
    
    private init() {}
    
    // MARK: - Get
    func getAlarmInfo() -> AlarmInfo? {
        if let data = userDefaults.data(forKey: Key.alarmInfo.rawValue) {
            do {
                let decoder = JSONDecoder()
                let alarmInfo = try decoder.decode(AlarmInfo.self, from: data)
                return alarmInfo
            } catch {
                print("ERROR: Get ExerciseInfo Failed")
            }
        }
        return nil
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
    func create(_ alarmInfo: AlarmInfo) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(alarmInfo)
            userDefaults.set(data, forKey: Key.alarmInfo.rawValue)
        } catch {
            print("ERROR: Create AlarmInfo Failed")
        }
    }
    
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
    private func updateUserDefautls(_ alarmInfo: AlarmInfo?) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(alarmInfo) {
            userDefaults.set(data, forKey: Key.alarmInfo.rawValue)
        }
    }
    
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
    
    func update(_ alarmInfo: AlarmInfo?) {
        updateUserDefautls(alarmInfo)
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
