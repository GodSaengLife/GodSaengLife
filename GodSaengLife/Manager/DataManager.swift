//
//  DataManager.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//

import UIKit

final class DataManager {
    static let shared = DataManager()
    private let alarmInfo = AlarmInfo()
    private let studyInfo = StudyInfo()
    private let exerciseInfo = ExerciseInfo()
    
    private init() {}
    
    // MARK: - Get
    func getAlarmInfo() -> AlarmInfo {
        return self.alarmInfo
    }
    
    func getStudyInfo() -> StudyInfo {
        return self.studyInfo
    }
    
    func getExerciseInfo() -> ExerciseInfo {
        return self.exerciseInfo
    }
    
    // MARK: - Update
    func updateWakeUpTime(alarmInfo: AlarmInfo) {
        self.alarmInfo.wakeUpTime = alarmInfo.wakeUpTime
    }
    
    func updateObjectiveTime(_ studyInfo: StudyInfo) {
        self.studyInfo.objectiveTime = studyInfo.objectiveTime
    }
    
    func updateObjectiveTime(_ exerciseInfo: ExerciseInfo) {
        self.exerciseInfo.objectiveTime = exerciseInfo.objectiveTime
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
