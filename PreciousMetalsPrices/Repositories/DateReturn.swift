import Foundation

func getCurrentPeriod() -> [Int] {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM"
    let thePeriod = dateFormater.string(from: Date())
    let dateArray = thePeriod.components(separatedBy: "-")
    var datePeriod: [Int] = [Int]()
    datePeriod.append((dateArray[0] as NSString).integerValue)
    datePeriod.append((dateArray[1] as NSString).integerValue)
    return datePeriod
}

func getMonth(value: Int) -> String {
    if value < 10 {
        return "0\(value)"
    } else {
        return "\(value)"
    }
}

func getMetalMinYear(metal: String) -> Int {
    switch metal {
    case "gold", "silver":
        return 1968
    case "platinum", "palladium":
        return 1990
    default:
        return 1968
    }
}

func getSelectedYear() -> Int{
    let observables = AppObservables()
    return observables.year
}

func getSelectedMonth() -> Int{
    let observables = AppObservables()
    return observables.month
}
