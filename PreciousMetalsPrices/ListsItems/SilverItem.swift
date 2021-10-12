//
//  SilverItem.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 19.09.2021.
//

import SwiftUI

struct SilverItem: View {
    
    var silverData : SilverPrices
    var currencyName = "USD"
    var position = 1
    
    var body: some View {
        
        ZStack {
            if position % 2 == 0 {
                Rectangle().foregroundColor(Color("BackgroundColor"))
            } else {
                Rectangle().foregroundColor(Color("HalfToneColor"))
            }
            HStack {
                Text(dateConverter(date: silverData.date))
                    .foregroundColor(Color("TextColor"))
                Spacer()
                Divider()
                Spacer()
                Text(numberConveter(number: getCurrencyValue()))
                    .foregroundColor(Color("TextColor"))
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .font(Font.custom("Arial", size: 15))
        }
    }
    
    private func getCurrencyValue() -> Double {
        var currencyValue = 0.0
        switch currencyName {
            case "USD": if silverData.USD != nil {
                currencyValue = silverData.USD!
            } else {
                currencyValue = 0.0
            }
        case "GBP": if silverData.GBP != nil {
            currencyValue = silverData.GBP!
        } else {
            currencyValue = 0.0
        }
        case "EUR": if silverData.EUR != nil {
            currencyValue = silverData.EUR!
        } else {
            currencyValue = 0.0
        }
        default: currencyValue = 0.0
        }
        return currencyValue
    }
}

struct SilverItem_Previews: PreviewProvider {
    static var previews: some View {
        let silverData = SilverPrices(date: "13.09.1977", USD: 4.60, GBP: 2.558, EUR: nil)
        SilverItem(silverData: silverData)
    }
}
