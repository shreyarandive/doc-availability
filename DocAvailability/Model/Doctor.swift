//
//  Doctor.swift
//  DocAvailability
//
//  Created by Shreya Randive on 9/17/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation

struct Response : Codable {
    var doctors: [Doctor]
}

struct Doctor : Codable {
    var id: Int
    var name: String
    var since: Date
    var license: String
    var shiftInfo: ShiftInfo
    var info: DoctorInfo?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case since
        case license
        case shiftInfo
    }
}

struct ShiftInfo : Codable {
    var startTime: Date
    var end: Date?
    var duration: Date
    
    private enum CodingKeys: String, CodingKey {
        case startTime
        case duration
    }
}

public struct DoctorInfo {
    var name: String
    var shift: TypeOfShiftTime
    var doctorSince: String
    
    init(_ Doctor: Doctor) {
        name = Doctor.name
        shift = TypeOfShiftTime()
        doctorSince = ""
    }
    
    init(name: String, shift: TypeOfShiftTime, doctorSince: String) {
        self.name = name
        self.shift = shift
        self.doctorSince = doctorSince
    }
}

struct TypeOfShiftTime {
    var startTime: TimeInfo
    var endTime: TimeInfo
    var duration: String
    
    init() {
        startTime = TimeInfo()
        endTime = TimeInfo()
        duration = ""
    }
    
    init(startTime: TimeInfo, endTime: TimeInfo, duration: String) {
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
    }
}

struct TimeInfo {
    var components: DateComponents
    var hhMM: Int
    var inString: String
    
    init() {
        components = DateComponents()
        hhMM = 0
        inString = ""
    }
    
    init(components: DateComponents, hhMM: Int, inString: String) {
        self.components = components
        self.hhMM = hhMM
        self.inString = inString
    }
}
