
import Foundation

// use https://app.quicktype.io from json to struct

// MARK: - AtfbankCurrencyResponse
struct AtfbankCurrencyResponse: Codable {
    let code: Int
    let data: [AtfbankDataResponse]
}

// MARK: - AtfbankDataResponse
class AtfbankDataResponse: CurrencyResponse {
    var priceSell, priceBuy: Double?
    let valcode, valcodebas: String
    
    enum CodingKeys: String, CodingKey {
        case priceBuy  = "buy"
        case priceSell = "sell"
        case valcode, valcodebas
    }
}
