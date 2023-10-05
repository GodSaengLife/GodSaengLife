//
//  DateFommater.swift
//  GodSaengLife
//
//  Created by t2023-m0078 on 2023/10/02.
//

import Foundation


class DateParser {
    
    static func getToday() -> String{
        var today = Date()
        let localizedDate = localizedRepresentation(today, format: "yy-MM-dd")
        
        return localizedDate
        
    }
    static func getDateString(_ date:Date) -> String{
        let localizedDate = localizedRepresentation(date, format: "yy-MM-dd")

        return localizedDate
    }
    
    static func getTimeLineString(_ date:Date) -> String{
        let localizedDate = localizedRepresentation(date, format: "hh시mm분")
        
        return localizedDate
    }

    static func localizedRepresentation(_ date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}

