import Foundation

// MARK: - CurrencyResponse

protocol CurrencyResponse: Codable {
    var priceSell:  Double?  { get }
    var priceBuy:   Double?  { get }
    var valcode:    String  { get }
    var valcodebas: String  { get }
}

