//
//  CountryScreen.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 21/03/23.
//

import SwiftUI

struct CountryScreen: View {
    @ObservedObject var viewModel: CountryViewModel
    @State var searchCountryCode = ""
    @State var countryName = ""
    var placeholder = "Select Country"
    var body: some View {
        VStack {
            Menu {
                ForEach(viewModel.countryResult ,id: \.name){ country in
                    Button(country.countryCode) {
                        self.searchCountryCode = country.countryCode
                        self.countryName = country.name
                    }
                }
            } label: {
                VStack(spacing: 5) {
                    HStack{
                        Text(searchCountryCode.isEmpty ? placeholder :searchCountryCode)
                            .foregroundColor(searchCountryCode.isEmpty ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.orange)
                            .font(Font.system(size: 20, weight: .bold))
                    }
                    .padding(.horizontal)
                    Rectangle()
                        .border(.orange)
                        .frame(height: 2)
                }
            }
            .frame(alignment: .top)
            .onAppear(perform: viewModel.countryData)
            NavigationView {
                List {
                    ForEach(viewModel.country, id: \.self) { names in
                        Text(names)
                    }
                }
            }
            .searchable(text: $viewModel.search)
        }
    }
}

struct CountryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CountryScreen(viewModel: CountryViewModel())
    }
}
