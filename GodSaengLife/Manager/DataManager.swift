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

}
