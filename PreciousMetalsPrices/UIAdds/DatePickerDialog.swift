//
//  DatePickerDialog.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 21.09.2021.
//

import SwiftUI

struct DatePickerDialog: View {
    
    let months = [LocalizedStringKey("January"),LocalizedStringKey("Febrary"),LocalizedStringKey("March"),LocalizedStringKey("April"),LocalizedStringKey("May"),LocalizedStringKey("June"),LocalizedStringKey("July"),LocalizedStringKey("August"),LocalizedStringKey("September"),LocalizedStringKey("October"),LocalizedStringKey("November"),LocalizedStringKey("December")]
    let currentYear = getCurrentPeriod()[0]
    @EnvironmentObject var appObservables: AppObservables
    @State private var selectedYear: Int = getSelectedYear()
    @State private var selectedMonth: Int = getSelectedMonth()-1
        
    var body: some View {
        HStack(spacing: 13) {
            Spacer()
            VStack {
                Text(LocalizedStringKey("choose_period"))
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(10)
                    .multilineTextAlignment(.center)
                HStack {
                    Picker(selection: $selectedMonth, label: Text("")) {
                        ForEach(months.indices, id: \.self) { monthIndex in
                            Text(months[monthIndex])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedMonth, perform: { yearIndex in
                        self.selectedMonth = yearIndex
                    })
                    Picker(selection: $selectedYear, label: Text("")) {
                        ForEach(appObservables.years, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedYear, perform: { value in
                        self.selectedYear = value
                    })
                }
                Button(action: {
                    appObservables.year = selectedYear
                    appObservables.month = selectedMonth+1
                    appObservables.isDateChoice = false
                    appObservables.isLoading = true
                }, label: {
                    Text("OK")
                        .font(.system(size: 22))
                        .padding(7)
                })
            }
            Spacer()
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top,20)
        .background(CornerRadiusShape(radius: 25, corners: [UIRectCorner .topLeft, UIRectCorner .topRight]).fill(Color("BackgroundColor")))
    }
}
