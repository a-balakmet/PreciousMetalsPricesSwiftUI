//
//  PreciousMetalsPricesApp.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 14.09.2021.
//

import SwiftUI

@main
struct PreciousMetalsPricesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppObservables())
        }
    }
}
