//
//  Webservices.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 23/03/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

//class Webservice: ObservableObject {
//
//    func holidayData(years: Int, countyCode: String? = nil) {
//        if countyCode == nil {
//            guard let url = URL(string: Constants.baseUrl) else { fatalError("Missing URL")
//            }
//            let request = URLRequest(url: url)
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let dateFormat = DateFormatter()
//                        dateFormat.dateFormat = "yyyy-MM-dd"
//                        decoder.dateDecodingStrategy = .formatted(dateFormat)
//                        let result = try decoder.decode([HolidayResponse].self, from: data)
//                        DispatchQueue.main.async {
//                            self.resultHoliday = result
//                        }
//                    } catch let error {
//                        print(error)
//                    }
//                }
//            }.resume()
//        } else {
//            guard let url = URL(string:"https://date.nager.at/api/v3/PublicHolidays/\(years)/\(countyCode!)") else { fatalError("Missing URL")
//            }
//            let request = URLRequest(url: url)
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let dateFormat = DateFormatter()
//                        dateFormat.dateFormat = "yyyy-MM-dd"
//                        decoder.dateDecodingStrategy = .formatted(dateFormat)
//                        let result = try decoder.decode([HolidayResponse].self, from: data)
//                        DispatchQueue.main.async {
//                            self.resultHoliday = result
//                        }
//                    } catch let error {
//                        print(error)
//                    }
//                }
//            }.resume()
//        }
//    }
//
//    func countryData() {
//        guard let url = URL(string: "https://date.nager.at/api/v3/AvailableCountries") else { fatalError("Missing URL")}
//        let request = URLRequest(url: url)
//        let defaultConfiguration = URLSessionConfiguration.ephemeral
//        let urlSession = URLSession(configuration: defaultConfiguration)
//
//        urlSession.dataTask(with: request) { data, response, error in
//
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//
//            if let data = data {
//                do {
//                    let result = try JSONDecoder().decode([CountryResponse].self, from: data)
//                    DispatchQueue.main.async {
//                        self.countryResult = result
//                        print("County Data call onApper")
//                    }
//                } catch let error {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
//}
