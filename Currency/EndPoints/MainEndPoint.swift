enum MainEndPoint: Endpoint {
    
    case altynCurrency
    case atfbankCurrency
    case halkCurrency

    var path: String {
        switch self {
        case .altynCurrency:
            return Global.pathFor(key: "altynCurrency")
        case .atfbankCurrency:
            return Global.pathFor(key: "atfbankCurrency")
        case .halkCurrency:
            return Global.pathFor(key: "halkCurrency")
        }
    }
    
    var parameters: RequestParameters? {
        switch self {
        case .altynCurrency:
            return ["baseCurrencyIsoCode": "KZT"]
        case .atfbankCurrency:
            return [:]
        case .halkCurrency:
            return [:]
        }
    }
    
    var body: BodyParameters? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}
