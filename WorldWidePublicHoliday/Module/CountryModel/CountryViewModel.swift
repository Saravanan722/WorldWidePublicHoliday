//
//  CountryViewModel.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 21/03/23.
//

import Foundation


class CountryViewModel: ObservableObject {
    @Published var countryResult : [CountryResponse] = []
    @Published var sortAscending: Bool = true
    @Published var search = ""
    @Published var searchCountryCode = ""
    @Published var countryName = ""
    var startDate = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2000)
        let endComponents = DateComponents(year: 2030)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var country: [String] {
        let isCountry = countryResult.map { $0.name.lowercased() }
        return search == "" ? isCountry : isCountry.filter { $0.contains(search.lowercased()) }
    }
    func countryData() {
        guard let url = URL(string: "https://date.nager.at/api/v3/AvailableCountries") else { fatalError("Missing URL")}
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([CountryResponse].self, from: data)
                    DispatchQueue.main.async {
                        self.countryResult = result
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    func sortCountryName() {
        countryResult.sort { h1, h2 in
            if sortAscending {
                return h1.name < h2.name
            } else {
                return h1.name > h2.name
            }
        }
    }
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: startDate)
    }
    
}
