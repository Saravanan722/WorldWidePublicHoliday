//
//  CountryScreen.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 21/03/23.
//

import SwiftUI

//struct CountryScreen: View {
    //    enum SortOrder {
    //        case ascending
    //        case descending
    //    }
    //    @State var sortOrder: SortOrder = .ascending
    //    @State private var Result : [String] = ["A","B","C","D","E","F","G","H"]
    //    @State private var isToggle : Bool = false
    
//    @ObservedObject var viewModel: CountryViewModel
//    var placeholder = "Select Country"
//    var body: some View {
//        ScrollView{
//            VStack{
//                Menu {
//                    ForEach(viewModel.countryResult ,id: \.name){ country in
//                        Button(country.name) {
//                            viewModel.searchCountryCode = country.countryCode
//                            viewModel.countryName = country.name
//                        }
//                    }
//                } label: {
//                    VStack(spacing: 5) {
//                        HStack{
//                            Text(viewModel.searchCountryCode.isEmpty ? placeholder:viewModel.searchCountryCode)
//                                .foregroundColor(viewModel.searchCountryCode.isEmpty ? .gray : .black)
//                            Spacer()
//                            Image(systemName: "chevron.down")
//                                .foregroundColor(Color.orange)
//                                .font(Font.system(size: 20, weight: .bold))
//                        }
//                        .padding(.horizontal)
//                        Rectangle()
//                            .border(.orange)
//                            .frame(height: 2)
//                    }
//                }
//                .onAppear(perform: viewModel.countryData)
//            }
//        }
//    }
//}
//            NavigationView {
//                List {
//                    ForEach(viewModel.country, id: \.self) { names in
//                        Text(names)
//                    }
//
//                }
//            }
//            .searchable(text: $viewModel.search)
//            HStack {
//                Text("Sort Order: ")
//                Picker(selection: $sortOrder, label: Text("")) {
//                    Text("Ascending").tag(SortOrder.ascending)
//                    Text("Descending").tag(SortOrder.descending)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//
//            }
//
//            List(Result, id: \.self) { country in
//                Text(country)
//            }
//            .onAppear {
//                sortCountries()
//            }
        
//    func sortCountries() {
//        switch sortOrder {
//        case .ascending:
//            Result = Result.sorted { $0 < $1}
//        case .descending:
//            Result = Result.sorted { $0 > $1 }
//        }
//    }
//}


//struct CountryScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryScreen(viewModel: CountryViewModel())
//    }
//}
