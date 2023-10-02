//
//  ExerciseInfo+CoreDataProperties.swift
//  GodSaengLife
//
//  Created by playhong on 2023/10/02.
//
//

import Foundation
import CoreData


extension ExerciseInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseInfo> {
        return NSFetchRequest<ExerciseInfo>(entityName: "ExerciseInfo")
    }

    @NSManaged public var totalTime: Date?
    @NSManaged public var currentTime: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var createDate: Date?

}

extension ExerciseInfo : Identifiable {

}
