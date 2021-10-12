import Foundation

let goldAm = "gold_am.json"
let goldPm = "gold_pm.json"
let argentum = "silver.json"
let platAm = "platinum_am.json"
let platPm = "platinum_pm.json"
let pallAm = "palladium_am.json"
let pallPm = "palladium_pm.json"

func getLinkAddress(suffix: String) -> String {
    return "https://prices.lbma.org.uk/json/\(suffix)"
}
