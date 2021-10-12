//
//  MetalItem.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 20.09.2021.
//

import SwiftUI

struct MetalItem: View {
    
    var metalData : MetalPrices
    var currencyName = "USD"
    var position = 1
    
    @State var orientation = UIDevice.current.orientation
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View {
        ZStack {
            if position % 2 == 0 {
                Rectangle().foregroundColor(Color("BackgroundColor"))
            } else {
                Rectangle().foregroundColor(Color("HalfToneColor"))
            }
            HStack {
                Text(dateConverter(date: metalData.date)).foregroundColor(Color("TextColor"))
                Spacer()
                Divider()
                Spacer()
                VStack {
                    Text("am:").foregroundColor(Color("TextColor"))
                    Text("pm:").foregroundColor(Color("TextColor"))
                }
                Spacer()
                Divider()
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Text(numberConveter(number: getCurrencyValue(isAm: true))).foregroundColor(Color("TextColor"))
                    }
                    HStack {
                        Spacer()
                        Text(numberConveter(number: getCurrencyValue(isAm: false))).foregroundColor(Color("TextColor"))
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
            .frame(maxWidth: .infinity)
            .font(Font.custom("Arial", size: 15))
        }
    }
        
    private func getCurrencyValue(isAm: Bool) -> Double {
        var currencyValue = 0.0
        switch currencyName {
        case "USD":
            if isAm {
                if metalData.amUSD != nil {
                    currencyValue = metalData.amUSD!
                } else {
                    currencyValue = 0.0
                }
            } else {
                if metalData.pmUSD != nil {
                    currencyValue = metalData.pmUSD!
                } else {
                    currencyValue = 0.0
                }
            }
        case "GBP":
            if isAm {
                if metalData.amGBP != nil {
                    currencyValue = metalData.amGBP!
                } else {
                    currencyValue = 0.0
                }
            } else {
                if metalData.pmGBP != nil {
                    currencyValue = metalData.pmGBP!
                } else {
                    currencyValue = 0.0
                }
            }
        case "EUR":
            if isAm {
                if metalData.amEUR != nil {
                    currencyValue = metalData.amEUR!
                } else {
                    currencyValue = 0.0
                }
            } else {
                if metalData.pmEUR != nil {
                    currencyValue = metalData.pmEUR!
                } else {
                    currencyValue = 0.0
                }
            }
        default: currencyValue = 0.0
        }
        return currencyValue
    }
}

struct MetalItem_Previews: PreviewProvider {
    static var previews: some View {
        let metalData = MetalPrices(date: "13-09-1977", amUSD: 147.8, amGBP: 84.762, amEUR: nil, pmUSD: 147.5, pmGBP: 84.585, pmEUR: nil)
        MetalItem(metalData: metalData)
    }
}
