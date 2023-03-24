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
//
//class Webservice {
//
//    func countryData() {
//        guard let url = URL(string: "https://date.nager.at/api/v3/AvailableCountries") else { fatalError("Missing URL")}
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
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
//                        //  self.countryResults = result
//                    }
//                } catch let error {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
//
//
//    func loadData() {
//        guard let url = URL(string: "https://date.nager.at/api/v3/PublicHolidays/2023/AT") else { fatalError("Missing URL")
//        }
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let dateFormat  = DateFormatter()
//                    dateFormat.dateFormat = "yyyy-MM-dd"
//                    decoder.dateDecodingStrategy = .formatted(dateFormat)
//                    let result = try decoder.decode([HolidayResponse].self, from: data)
//                    DispatchQueue.main.async {
//                        // self.results = result
//                    }
//                } catch let error {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
//}
