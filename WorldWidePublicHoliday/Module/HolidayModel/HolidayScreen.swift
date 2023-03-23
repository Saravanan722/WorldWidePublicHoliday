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
                DatePicker("Start : ",selection: $viewModel.startDate, in: ...Date.now, displayedComponents: .date)
                DatePicker("End : ", selection: $viewModel.endDate, in: ...Date.now, displayedComponents: .date)
            }
            ZStack{
                List {
                    ForEach(viewModel.filterHoliday, id: \.date) { date in
                        Text("CountryName : \(date.name)")
                        Text("Holiday : \(date.localName)")
                        Text("Date : \(date.date)")
                        
                    }
                    .foregroundColor(.blue)
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
