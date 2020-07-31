import Foundation

protocol MainWorking {
    func altynCurrency(endPoint: MainEndPoint, complition: @escaping (Result<AltynCurrencyResponse, NetworkError>) -> Void)
    func atfbankCurrency(endPoint: MainEndPoint, complition: @escaping (Result<AtfbankCurrencyResponse, NetworkError>) -> Void)
    func halkCurrency(endPoint: MainEndPoint, complition: @escaping (Result<HalykbankCurrencyResponse , NetworkError>) -> Void)
}

