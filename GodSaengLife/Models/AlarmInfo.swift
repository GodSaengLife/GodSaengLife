//
//  AlarmInfo.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//

import UIKit

class AlarmInfo: Codable {
    var wakeUpTime: Date?
    var isActivated: Bool = false
    var isDone: Bool = false
}
