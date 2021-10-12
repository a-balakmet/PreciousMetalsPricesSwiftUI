import SwiftUI

class AppObservables: ObservableObject {
    
    @Published var isNetwork = false
    @Published var month = getCurrentPeriod()[1]
    @Published var year = getCurrentPeriod()[0]
    @Published var isDateChoice = false
    @Published var metalList: [MetalPrices]? = [MetalPrices]()
    @Published var silverList: [SilverPrices]? = [SilverPrices]()
    
    @Published var years: [Int] = [Int]()
    
    @Published var metalName = "gold" {
        didSet {
            if metalName == "platinum" || metalName == "palladium" {
                if year < 1990 {
                    year = 1990
                }
            }
            years = Array(getMetalMinYear(metal: self.metalName)...getCurrentPeriod()[0])
        }
    }
    
    @Published var isLoading = false {
        didSet {
            if self.isLoading {
                if self.isNetwork {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
                        self.isLoading = false
                    })
                }
                if metalName == "silver" {
                    metalList = nil
                    silverList = getSilverData(date: "\(year)-\(getMonth(value: month))")
                } else {
                    silverList = nil
                    metalList = getMetalsData(date: "\(year)-\(getMonth(value: month))", metal: metalName)
                }
            }
        }
    }
    
    init() {
        years = Array(getMetalMinYear(metal: self.metalName)...year)
        isNetwork = Reachability.isConnectedToNetwork()
    }
}
