//
//  ContentView.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewVM: CountryViewModel
    @State var filterHoliday: [HolidayResponse] = []
    
    @ObservedObject var viewModel: HolidayViewModel
    var placeholder = "Select Country"
    
    var body: some View {
        VStack {
            Menu {
                ForEach(viewVM.countryResult ,id: \.name){ country in
                    Button(country.name) {
                        viewModel.getCountryCode = country.countryCode
                        viewVM.countryName = country.name
                    }
                }
            } label: {
                VStack(spacing: 5) {
                    HStack{
                        Text(viewVM.countryName.isEmpty ? placeholder:viewVM.countryName)
                            .foregroundColor(viewVM.countryName.isEmpty ? .gray : .black)
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
            .onAppear(perform: viewVM.countryData)
        }
        HStack {
            DatePicker("From Date : ",selection: $viewModel.startDate, in: viewModel.dateRange, displayedComponents: .date)
            DatePicker("End Date: ", selection: $viewModel.endDate, in: viewModel.dateRange, displayedComponents: .date)
        }
        Button(action: {
            print("Button action")
            self.filterHoliday = viewModel.dateFilter()
        }) {
            Text("Update Search")
                .padding(10.0)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                        .shadow(color: .blue, radius: 10.0)
                        .frame(minWidth: 0,maxWidth: .infinity)
                )
        }
        .cornerRadius(4)
        
//        HStack {
//            Text("Sort Order: ")
//            Picker(selection: $viewModel.sortOrder, label: Text("")) {
//                Text("Ascending").tag(HolidayViewModel.SortOrder.ascending)
//                Text("Descending").tag(HolidayViewModel.SortOrder.descending)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//
//        }
//
//        List( viewModel.resultHoliday, id: \.date) { country in
//            Text("\(country.name)")
//        }
//        .onAppear {
//            viewModel.sortCountries()
//        }
        
        List {
            ForEach(filterHoliday, id: \.date) { holiday in
                Text("Country Name : ")
                    .foregroundColor(.black)
                +
                Text(viewVM.countryName)
                    .foregroundColor(.blue)
                
                Text("Country Code : ")
                    .foregroundColor(.black)
                +
                Text(holiday.countryCode)
                    .foregroundColor(.blue)
                Text("Holiday : ")
                    .foregroundColor(.black)
                
                + Text(holiday.name)
                    .foregroundColor(.blue)
                
                Text("Local Name : ")
                    .foregroundColor(.black)
                
                + Text(holiday.localName)
                    .foregroundColor(.blue)
                
                Text("Date : ")
                    .foregroundColor(.black)
                + Text("\(holiday.date)")
                    .foregroundColor(.blue)
            }
        }
        .background(Color.purple)
        .onReceive(viewModel.$getCountryCode, perform: { publisher in
            viewModel.holidayData(countyCode: publisher)
            print("onRecive method call to action")
            
        })
        .onAppear(perform: { viewModel.holidayData()
            print("Holiday data method holiday() call")
        })
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewVM: CountryViewModel(), viewModel: HolidayViewModel())
    }
}


