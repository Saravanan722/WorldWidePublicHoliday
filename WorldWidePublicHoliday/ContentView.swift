//
//  ContentView.swift
//  WorldWidePublicHoliday
//
//  Created by Innocrux on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            CountryScreen(viewModel: CountryViewModel())
            HolidayScreen(viewModel: HolidayViewModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


