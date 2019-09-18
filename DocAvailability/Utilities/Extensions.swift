//
//  Extensions.swift
//  DocAvailability
//
//  Created by Shreya Randive on 9/17/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation

extension Doctor {
    
    func addShiftDurationToStartTime() -> Date {
        
        return self.shiftInfo.startTime.addingTimeInterval(self.shiftInfo.duration.timeIntervalSince1970)
        
    }
    
    func getTimesInString() -> (start: String, end: String, duration: String) {
        let doctor = self
        
        let dateFormatter = DateFormatter.timeSinceLocalMidnight
        let shiftStartTime = dateFormatter.string(from: doctor.shiftInfo.startTime).replacingOccurrences(of: " ", with: "")
        let shiftEndTime = dateFormatter.string(from: doctor.shiftInfo.end ?? Date()).replacingOccurrences(of: " ", with: "")
        
        return ("\(shiftStartTime)", "\(shiftEndTime)", "\(shiftStartTime) to \(shiftEndTime)")
    }
    
    func getLicenseSince() -> String {
        
        return "\(self.license) since \(DateFormatter.dateSinceEpochFormatter.string(from: self.since))"
        
    }
    
    func getShiftTimeInfo() -> (start: TimeInfo, end: TimeInfo, duration: String) {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let startTimeComponents = calendar.getTimeComponents(time: self.shiftInfo.startTime)
        var endTimeComponents = calendar.getTimeComponents(time: self.shiftInfo.end ?? Date())
        
        let startHHMM = startTimeComponents.hour! * 100 + startTimeComponents.minute!
        
        var endHHMM = endTimeComponents.hour! * 100 + endTimeComponents.minute!
        
        if startHHMM > endHHMM {
            endTimeComponents.hour = endTimeComponents.hour! + 24
            endHHMM = endTimeComponents.hour! * 100 + endTimeComponents.minute!
        }
        
        let times = self.getTimesInString()
        let start = TimeInfo(components: startTimeComponents, hhMM: startHHMM, inString: times.start)
        let end = TimeInfo(components: endTimeComponents, hhMM: endHHMM, inString: times.end)
        
        return (start, end, times.duration)
    }
    
}

extension DateFormatter {
    
    static var dateSinceEpochFormatter : DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
       
        return dateFormatter
    }()
    
    static var timeSinceLocalMidnight : DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        timeFormatter.defaultDate = Date()
        timeFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return timeFormatter
    }()
    
}

extension Calendar {
    
    func getTimeComponents(time: Date) -> DateComponents {
        let units: Set<Calendar.Component> = Set(arrayLiteral: .hour, .minute, .second)
        let timeComponents = self.dateComponents(units, from: time)
       
        return timeComponents
    }
    
}
