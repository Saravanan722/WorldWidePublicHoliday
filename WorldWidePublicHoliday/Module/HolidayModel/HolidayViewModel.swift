//
//  HolidayViewModel.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import Foundation

class HolidayViewModel: ObservableObject {
    
    enum SortOrder {
            case ascending
            case descending
        }
    @Published var sortOrder: SortOrder = .descending
    
    @Published var getCountryCode = ""
    @Published var resultHoliday: [HolidayResponse] = []
    var filterHoliday: [HolidayResponse] {
        return resultHoliday.filter { compareDate(date: $0.date) }
    }
    @Published var startDate = Date()
    @Published var endDate = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2000, month: 1, day: 1)
        let endComponents = DateComponents(year: 2030, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    
    func holidayData(countyCode: String? = nil) {
        if (countyCode == nil) {
            guard let url = URL(string:"https://date.nager.at/api/v3/PublicHolidays/2023/AT") else { fatalError("Missing URL")
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        let result = try decoder.decode([HolidayResponse].self, from: data)
                        DispatchQueue.main.async {
                            self.resultHoliday = result
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        } else {
            guard let url = URL(string:"https://date.nager.at/api/v3/PublicHolidays/2023/\(countyCode!)") else { fatalError("Missing URL")
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        let result = try decoder.decode([HolidayResponse].self, from: data)
                        DispatchQueue.main.async {
                            self.resultHoliday = result
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    func compareDate(date : Date) -> Bool {
        date >= startDate && date <= endDate
    }
    
    func dateFilter() -> [HolidayResponse] {
        return resultHoliday.filter { compareDate(date: $0.date) }
    }
    func sortCountries() {
        switch sortOrder {
        case .ascending:
            resultHoliday = resultHoliday.sorted { $0.name < $1.name}
        case .descending:
            resultHoliday = resultHoliday.sorted { $0.name > $1.name }
        }
    }
}


