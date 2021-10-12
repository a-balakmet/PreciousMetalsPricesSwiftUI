import Foundation

func getMetalsData(date: String, metal: String) -> [MetalPrices]? {
    var metalData = [MetalPrices]()
    var metalDataAm: [MetalPrices]? = [MetalPrices]()
    var metalDataPm: [MetalPrices]? = [MetalPrices]()
    var suffixes = [String]()
    switch metal {
    case "gold":
        suffixes.append(getLinkAddress(suffix: goldAm))
        suffixes.append(getLinkAddress(suffix: goldPm))
    case "platinum":
        suffixes.append(getLinkAddress(suffix: platAm))
        suffixes.append(getLinkAddress(suffix: platPm))
    case "palladium":
        suffixes.append(getLinkAddress(suffix: pallAm))
        suffixes.append(getLinkAddress(suffix: pallPm))
    default:
        suffixes.append(getLinkAddress(suffix: goldAm))
        suffixes.append(getLinkAddress(suffix: goldPm))
    }
    metalDataAm = getMetalDataByPeriod(suffix: suffixes[0], date: date)
    metalDataPm = getMetalDataByPeriod(suffix: suffixes[1], date: date)
    for amData in metalDataAm! {
        for pmData in metalDataPm! {
            if pmData.date == amData.date {
                let price = MetalPrices(date: amData.date, amUSD: amData.amUSD, amGBP: amData.amGBP, amEUR: amData.amEUR, pmUSD: pmData.pmUSD, pmGBP: pmData.pmGBP, pmEUR: pmData.pmEUR)
                metalData.append(price)
            }
        }
    }
    return metalData
}

private func getMetalDataByPeriod (suffix: String, date: String) -> [MetalPrices]? {
    var metalData = [MetalPrices]()
    let sem = DispatchSemaphore.init(value: 0)
    guard let url = URL(string: suffix) else {
        return nil
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        defer { sem.signal() }
        if let data = data {
            if let response = try? JSONDecoder().decode([PriceData].self, from: data) {
                if (suffix.contains("am")) {
                    for aPrice in response {
                        if aPrice.d.contains(date) {
                            let metalPrice = MetalPrices(date: aPrice.d, amUSD: aPrice.v[0], amGBP: aPrice.v[1], amEUR: aPrice.v[2], pmUSD: nil, pmGBP: nil, pmEUR: nil)
                            metalData.append(metalPrice)
                        }
                    }
                } else {
                    for aPrice in response {
                        if aPrice.d.contains(date) {
                            let metalPrice = MetalPrices(date: aPrice.d, amUSD: nil, amGBP: nil, amEUR: nil, pmUSD: aPrice.v[0], pmGBP: aPrice.v[1], pmEUR: aPrice.v[2])
                            metalData.append(metalPrice)
                        }
                    }
                }
            }
        }
    }.resume()
    sem.wait()
    return metalData
}

func getSilverData(date: String) -> [SilverPrices]? {
    let sem = DispatchSemaphore.init(value: 0)
    var silverData = [SilverPrices]()
    guard let url = URL(string: getLinkAddress(suffix: argentum)) else {
        return nil
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        defer { sem.signal() }
        if let data = data {
            if let response = try? JSONDecoder().decode([PriceData].self, from: data) {
                for aPrice in response {
                    if (aPrice.d.contains(date)) {
                        let silverPrice = SilverPrices(date: aPrice.d, USD: aPrice.v[0], GBP: aPrice.v[1], EUR: aPrice.v[2])
                        silverData.append(silverPrice)
                    }
                }
            }
        }
    }.resume()
    sem.wait()
    return silverData
}
