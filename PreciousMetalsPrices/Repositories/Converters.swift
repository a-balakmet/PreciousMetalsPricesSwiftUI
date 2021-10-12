import Foundation

func dateConverter(date: String) -> String {
    let oldDateFormater = DateFormatter()
    oldDateFormater.dateFormat = "yyyy-MM-dd"
    let oldDate = oldDateFormater.date(from: date)
    let newDateFormter = DateFormatter()
    newDateFormter.dateFormat = "dd.MM.yy"
    return newDateFormter.string(from: oldDate!)
}

func numberConveter(number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 3
    formatter.minimumFractionDigits = 3
    formatter.groupingSeparator = " "
    let newNumber = NSNumber(value: number)
    return formatter.string(from: newNumber)!
}
