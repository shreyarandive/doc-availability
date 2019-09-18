//
//  Parser.swift
//  DocAvailability
//
//  Created by Shreya Randive on 9/17/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation

class Parser {
    static let instance = Parser()
    var doctors = [Doctor]()
    
    func getTherapistsData(completion: @escaping (_ allTherapists: [Doctor]) -> Void) {
        parseJSON()
        doctors.sort(by: {$0.info?.shift.startTime.hhMM ?? 0 < $1.info?.shift.startTime.hhMM ?? 0})
        completion(doctors)
    }
    
    func parseJSON() {
        guard let url = Bundle.main.url(forResource: DOCTORS_JSON, withExtension: ".json") else { return }
        let data = try! Data(contentsOf: url)
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let response = try decoder.decode(Response.self, from: data)
            doctors = response.doctors
        } catch let error {
            debugPrint(error as Any)
        }
    }
}

