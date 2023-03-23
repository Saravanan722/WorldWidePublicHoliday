//
//  Holidays.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 21/03/23.
//

import Foundation

struct HolidayResponse : Decodable {
    let date: Date
    let localName: String
    let name: String
    let countryCode: String
    let fixed: Bool
    let global: Bool
    var counties: [String]?
    let launchYear: Int?
    var types: [String] = []
}
