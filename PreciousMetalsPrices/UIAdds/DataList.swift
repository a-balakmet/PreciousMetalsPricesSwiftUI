//
//  DataList.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 20.09.2021.
//

import SwiftUI

struct DataList: View {
    
    var metalList: [MetalPrices]? = [MetalPrices]()
    var silverList: [SilverPrices]? = [SilverPrices]()
    var currencyName = "USD"
    
    var body: some View {
        ZStack {
            if silverList != nil {
                List {
                    ForEach(Array(silverList!.enumerated()), id: \.offset) { index, element in
                        SilverItem(silverData: element, currencyName: currencyName, position: index)
                    }
                }
            }
            if metalList != nil {
                List {
                    ForEach(Array(metalList!.enumerated()), id: \.offset) { index, element in
                        MetalItem(metalData: element, currencyName: currencyName, position: index)
                    }
                }
            }
        }
        
    }
}

struct DataList_Previews: PreviewProvider {
    static var previews: some View {
        DataList()
    }
}
