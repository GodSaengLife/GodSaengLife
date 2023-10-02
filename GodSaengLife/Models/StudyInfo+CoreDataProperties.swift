//
//  StudyInfo+CoreDataProperties.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//
//

import Foundation
import CoreData


extension StudyInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudyInfo> {
        return NSFetchRequest<StudyInfo>(entityName: "StudyInfo")
    }

    @NSManaged public var totalTime: Date?
    @NSManaged public var currentTime: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var createDate: Date?

}

extension StudyInfo : Identifiable {

}
