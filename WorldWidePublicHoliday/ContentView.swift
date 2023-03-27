//
//  ContentView.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewVM: CountryViewModel
    @State var isSelectCountryCode = ""
    @State var filterHoliday: [HolidayResponse] = []
    @State var selection = Date()
    @ObservedObject var viewModel: HolidayViewModel
    var placeholder = "Select Country"
    var year = "Select Year"
    var body: some View {
        VStack {
            HStack {
                Menu {
                    ForEach(viewVM.countryResult ,id: \.name){ country in
                        Button(country.name) {
                            viewModel.getCountryCode = country.countryCode
                            viewVM.countryName = country.name
                        }
                        .padding()
                        .padding(.horizontal)
                        Rectangle()
                            .border(.red)
                            .frame(height: 2)
                        
                    }
                    
                } label: {
                    VStack(spacing: 5) {
                        HStack{
                            Text(viewVM.countryName.isEmpty ? placeholder:viewVM.countryName)
                                .foregroundColor(viewVM.countryName.isEmpty ? .gray : .black)
                                .frame(width: 150, height: 40, alignment: .trailing)
                            
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.orange)
                                .font(Font.system(size: 20, weight: .bold))
                            // .frame(width: 50, height: 40, alignment:.trailing)
                        }
                        .padding()
                        
                    }
                    
                }
                Menu {
                    ForEach(2000...2030, id: \.self) { year in
                        Button("\(year)") {
                            viewModel.getYear = "\(year)"
                        }
                        .padding()
                    }
                } label: {
                    VStack(spacing: 5) {
                        HStack{
                            Picker("", selection: $selection) {
                                
                            }
                            .frame(width: 50, height: 40, alignment: .leading)
                            .pickerStyle(InlinePickerStyle())
                            Spacer()
                            Text(viewModel.getYear.isEmpty ? year: viewModel.getYear  )
                                .foregroundColor(viewModel.getYear.isEmpty ? .gray : .black)
                                .frame(width: 150, height: 40, alignment:.leading)
                            
                            
                        }
                    }
                }
                .onAppear(perform: viewVM.countryData)
            }
            .padding(.horizontal)
            .cornerRadius(8)
            HStack {
                DatePicker("From Date : ",selection: $viewModel.startDate, in: viewModel.dateRange, displayedComponents: .date)
                DatePicker("End Date: ", selection: $viewModel.endDate, in: viewModel.dateRange, displayedComponents: .date)
            }
            Button(action: {
                print("Button action")
                self.filterHoliday = viewModel.dateFilter()
            })
            {
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
                self.isSelectCountryCode = publisher
                print("onRecive CountryCode call to action")
                
            })
            .onReceive(viewModel.$getYear, perform: { publisher in
                if(viewModel.getCountryCode.count == 2 && publisher.count == 4){
                    viewModel.holidayData(years: publisher,countyCode: isSelectCountryCode)
                    print("onRecive Year call to action")
                    
                }
                
            })
            .onAppear(perform: { viewModel.holidayData()
                print("Holiday data method holiday() call")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewVM: CountryViewModel(), viewModel: HolidayViewModel())
    }
}


