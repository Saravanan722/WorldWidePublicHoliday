//
//  ContentView.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewVM: CountryViewModel
    @State var selectCountryCode = ""
    let gradient = Gradient(colors: [.purple, .blue])
    let gradientBackround = Gradient(colors: [.white, .white])
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
                    }
                } label: {
                    VStack(spacing: 5) {
                        HStack {
                            Text(viewVM.countryName.isEmpty ? placeholder:viewVM.countryName)
                                .foregroundColor(viewVM.countryName.isEmpty ? .gray : .black)
                                .frame(height: 30)
                            
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.gray)
                                .font(Font.system(size: 20, weight: .bold))
                        }
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .purple, radius: 10.0)
                                .frame(minWidth: 0,maxWidth: .infinity)
                        )
                    }
                    .background(.linearGradient(gradientBackround, startPoint: .leading, endPoint: .trailing))
                    
                }
                .cornerRadius(10)
                .padding(4)
                
                
                Menu {
                    ForEach(2000...2030, id: \.self) { year in
                        Button(String(year)) {
                            viewModel.getYear = year
                        }
                    }
                } label: {
                    VStack(spacing: 5) {
                        HStack {
                            Text(String(viewModel.getYear))
                                .foregroundColor(.black)
                                .frame(height: 30)
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.gray)
                                .font(Font.system(size: 20, weight: .bold))
                            
                        }
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .purple, radius: 10.0)
                                .frame(minWidth: 0,maxWidth: .infinity)
                        )
                    }
                    .background(.linearGradient(gradientBackround, startPoint: .leading, endPoint: .trailing))
                    
                }
                .cornerRadius(10)
                
            }
            .padding(4)
            .background(.linearGradient(gradient, startPoint: .leading, endPoint: .topTrailing))
            .onAppear(perform: viewVM.countryData)
            
            HStack {
                DatePicker("From:", selection: $viewModel.startDate, in: viewModel.dateRange, displayedComponents: .date)
                Spacer()
                DatePicker("End:",selection: $viewModel.endDate, in: viewModel.dateRange, displayedComponents: .date)
                
            }
            .background(.linearGradient(gradientBackround, startPoint: .leading, endPoint: .trailing))
            .border(Color.blue)
            .padding(4.0)

            Button {
                viewModel.setFilterData()
            } label: {
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
            .background(.linearGradient(gradientBackround, startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            
            List {
                ForEach(viewModel.filterHoliday, id: \.date) { holiday in
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Country : ")
                            .foregroundColor(.black)
                        +
                        Text(viewVM.countryName.isEmpty ? "Australia": viewVM.countryName )
                            .foregroundColor(.blue)
                        
                        Text("Holiday :  ")
                            .foregroundColor(.black)
                        
                        + Text(holiday.name)
                            .foregroundColor(.blue)
                        
                        Text("Date      :  ")
                            .foregroundColor(.black)
                        + Text("\(viewModel.dateMyFormate(date:holiday.date))")
                            .foregroundColor(.blue)
                        
                        Text("Day       :  ")
                            .foregroundColor(.black)
                        
                        + Text("\(viewModel.dayOfWeek(date: holiday.date))")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
            }
            .listStyle(.insetGrouped)
            .background(.linearGradient(gradient, startPoint: .top, endPoint: .bottom))
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onReceive(viewModel.$getCountryCode, perform: { publisher in
                self.selectCountryCode = publisher
                print("onRecive CountryCode call to action")
                viewModel.holidayData(years: viewModel.getYear, countyCode: selectCountryCode)
                
            })
            .onReceive(viewModel.$getYear, perform: { publisher in
                if viewModel.getCountryCode.count == 2 {
                    viewModel.holidayData(years: publisher,countyCode: selectCountryCode)
                    print("onRecive Year call to action")
                }
                
            })
            .onAppear(perform: {
                viewModel.holidayData(years: viewModel.getYear)
                print("Holiday data method holiday() call")
            })
            
        }
        .background(.linearGradient(gradient, startPoint: .top, endPoint: .bottom))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewVM: CountryViewModel(), viewModel: HolidayViewModel())
    }
}


