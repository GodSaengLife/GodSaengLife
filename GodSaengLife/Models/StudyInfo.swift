//
//  StudyInfo.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//

import UIKit

protocol Info {
    var totalTime: Int? { get }
    var isDone: Bool { get }
    var objectiveTime: Int? { get }
}

class StudyInfo: Info {
    var totalTime: Int?
    var isDone: Bool = false
    var objectiveTime: Int?
}
