//
//  AlarmInfo+CoreDataProperties.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//
//

import Foundation
import CoreData


extension AlarmInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlarmInfo> {
        return NSFetchRequest<AlarmInfo>(entityName: "AlarmInfo")
    }

    @NSManaged public var wakeUpTime: Date?
    @NSManaged public var isActive: Bool
    @NSManaged public var createDate: Date?

}

extension AlarmInfo : Identifiable {

}
