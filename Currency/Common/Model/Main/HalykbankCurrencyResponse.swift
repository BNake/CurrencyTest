
import Foundation

// MARK: - HalykbankCurrencyResponse
struct HalykbankCurrencyResponse: Codable {
    let result: Bool
    let data: HalykbankDataResponse
}

// MARK: - DataClass
struct HalykbankDataResponse: Codable {
    let currencyHistory: QuantumValue
    let currencyTypes: CurrencyTypes

    enum CodingKeys: String, CodingKey {
        case currencyHistory, currencyTypes
    }
}

// MARK: - QuantumValue
enum QuantumValue: Codable {

    case dict([String: CurrencyHistory]), array([CurrencyHistory])

    init(from decoder: Decoder) throws {
        if let vals = try? decoder.singleValueContainer().decode([String: CurrencyHistory].self) {
            self = .dict(vals)
            return
        }

        if let string = try? decoder.singleValueContainer().decode([CurrencyHistory].self) {
            self = .array(string)
            return
        }

        throw QuantumError.missingValue
    }

    enum QuantumError:Error {
        case missingValue
    }
}

extension QuantumValue {
    enum CodingKeys: CodingKey {
        case dict, array
    }
}

extension QuantumValue {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .array(let array):
            try container.encode(array, forKey: .array)
        case .dict(let dict):
            try container.encode(dict, forKey: .dict)
        }
    }
}


// MARK: - CurrencyHistory
struct CurrencyHistory: Codable {
    let date, dateTitle: String
    let privatePersons, legalPersons, crossCourses, cards: [String: Card]
}

// MARK: - Card
struct Card: Codable {
    let sell, buy: Double
}

// MARK: - CurrencyTypes
struct CurrencyTypes: Codable {
    let cards, privatePersons, legalPersons, crossCourses: String
}

// MARK: - HalykbankCurrencyModelResponse
class HalykbankCurrencyModelResponse: CurrencyResponse {
    var priceSell, priceBuy: Double?
    let valcode, valcodebas: String
    
    init(priceSell: Double?, priceBuy: Double?, valcode: String, valcodebas: String){
        self.priceSell  = priceSell
        self.priceBuy   = priceBuy
        self.valcode    = valcode
        self.valcodebas = valcodebas
    }
}
