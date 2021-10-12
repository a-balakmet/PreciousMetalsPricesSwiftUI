//
//  MetalsData.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 15.09.2021.
//

import Foundation

struct PricesData: Decodable {
    var list: [PriceData]
}

struct PriceData: Decodable {
    var d: String
    var v: [Double?]
}
