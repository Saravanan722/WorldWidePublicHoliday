//
//  HolidayViewModel.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import Foundation
import Combine

class HolidayViewModel: ObservableObject {
    
    @Published var getCountryCode: String = "Australia"
    @Published var getYear: Int = 2023
    private var resultHoliday: [HolidayResponse] = [] {
        didSet {
            setFilterData()
        }
    }
    
    @Published var filterHoliday: [HolidayResponse] = []
    
    var dateRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: getYear, month: 1, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let endComponents = DateComponents(year: getYear, month: 12, day: 31, hour: 0, minute: 0, second: 0, nanosecond: 0)
        return calendar.date(from: startComponents)!
        ...
        calendar.date(from: endComponents)!
    }
    
    @Published var startDate = Date()
    @Published var endDate = Date()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        
        $getYear
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink {[weak self] year in
                self?.updateStartAndEndDate()
            }.store(in: &cancellable)
    }
    
    private func updateStartAndEndDate() {
        startDate = dateRange.lowerBound
        endDate = dateRange.upperBound
        setFilterData()
    }
    
    func setFilterData() {
        filterHoliday = resultHoliday.filter { compareDate(date: $0.date) }
    }
    
    func holidayData(years: Int, countyCode: String? = nil) {
        if countyCode == nil {
            guard let url = URL(string: Constants.baseUrl) else { fatalError("Missing URL")
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
            guard let url = URL(string:"https://date.nager.at/api/v3/PublicHolidays/\(years)/\(countyCode!)") else { fatalError("Missing URL")
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
}
