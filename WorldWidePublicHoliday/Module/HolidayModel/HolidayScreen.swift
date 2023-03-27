//
//  HolidayScreen.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import SwiftUI

//struct HolidayScreen: View {
//    @State var updateSearch = true
//    @ObservedObject var viewModel: HolidayViewModel
//    var body: some View {
//        VStack {
//            HStack {
//                DatePicker("From Date : ",selection: $viewModel.startDate, in: viewModel.dateRange, displayedComponents: .date)
//                DatePicker("End Date: ", selection: $viewModel.endDate, in: viewModel.dateRange, displayedComponents: .date)
//            }
//                Button(action: {
//                    print("Button action")
//                }) {
//                    Text("Update Search")
//                        .padding(10.0)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10.0)
//                                .stroke(lineWidth: 2.0)
//                                .shadow(color: .blue, radius: 10.0)
//                                .frame(minWidth: 0,maxWidth: .infinity)
//                        )
//                }
//            .cornerRadius(4)
//                List {
//                    ForEach(viewModel.resultHoliday, id: \.date) { holiday in
//                        Text("Country Name :")
//                            .foregroundColor(.black)
//                        +
//                        Text("#############")
//                            .foregroundColor(.blue)
//
//                        Text("Country Code :")
//                            .foregroundColor(.black)
//                        +
//                        Text(" \(holiday.countryCode)")
//                            .foregroundColor(.blue)
//                        Text("Holiday :")
//                            .foregroundColor(.black)
//                        + Text(" \(holiday.name)")
//                            .foregroundColor(.blue)
//                        Text("Local Name :")
//                            .foregroundColor(.black)
//                        + Text(" \(holiday.localName)")
//                            .foregroundColor(.blue)
//                        Text("Date :")
//                            .foregroundColor(.black)
//                        + Text(" \(holiday.date)")
//                            .foregroundColor(.blue)
//                    }
//                }
//                .background(Color.purple)
//        }
//        .onAppear {
//            viewModel.holidayData()
//        }
//    }
//}
//
//struct HolidayScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HolidayScreen(viewModel: HolidayViewModel())
//    }
//}
