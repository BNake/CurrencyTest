
import Foundation

// MARK: - AltynCurrencyResponseElement

class AltynCurrencyResponseElement: CurrencyResponse {
    var priceSell, priceBuy: Double?
    let valcode, valcodebas: String
    var ratePurchase: String?, rateSale: String?
    
    enum CodingKeys: String, CodingKey {
        case ratePurchase, rateSale, priceSell, priceBuy
        case valcode = "baseCurrencyIsoCode"
        case valcodebas = "targetCurrencyIsoCode"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        valcode = try container.decode(String.self, forKey: .valcode)
        valcodebas = try container.decode(String.self, forKey: .valcodebas)
        rateSale = try container.decode(String.self, forKey: .rateSale)
        ratePurchase = try container.decode(String.self, forKey: .ratePurchase)
        
        self.priceBuy = Double(ratePurchase ?? "0") ?? 0
        self.priceSell = Double(rateSale ?? "0") ?? 0
    }
    
    
}


// MARK: - TypeClass
struct TypeClass: Codable {
    let id: Int
    let value, label: String
}

typealias AltynCurrencyResponse = [AltynCurrencyResponseElement]
