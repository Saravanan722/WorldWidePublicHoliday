//
//  HolidayScreen.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import SwiftUI

struct HolidayScreen: View {
    
    @ObservedObject var viewModel: HolidayViewModel
    
    var body: some View {
        VStack {
            HStack {
                DatePicker("Start : ",selection: $viewModel.startDate, in: viewModel.dateRange, displayedComponents: .date)
                DatePicker("End : ", selection: $viewModel.endDate, in: viewModel.dateRange, displayedComponents: .date)
            }
            ZStack{
                List {
                    ForEach(viewModel.filterHoliday, id: \.date) { holiday in
                        Text("Country Name :")
                            .foregroundColor(.black)
                        +
                        Text("#############")
                            .foregroundColor(.blue)
                        Text("Country Code :")
                            .foregroundColor(.black)
                        +
                        Text(" \(holiday.countryCode)")
                            .foregroundColor(.blue)
                        Text("Holiday :")
                            .foregroundColor(.black)
                        + Text(" \(holiday.name)")
                            .foregroundColor(.blue)
                        Text("Local Name :")
                            .foregroundColor(.black)
                        + Text(" \(holiday.localName)")
                            .foregroundColor(.blue)
                        Text("Date :")
                            .foregroundColor(.black)
                        + Text(" \(holiday.date)")
                            .foregroundColor(.blue)
                    }
                }
                .background(Color.purple)
            }
        }
        .onAppear(perform: viewModel.holidayData)
    }
}

struct HolidayScreen_Previews: PreviewProvider {
    static var previews: some View {
        HolidayScreen(viewModel: HolidayViewModel())
    }
}
