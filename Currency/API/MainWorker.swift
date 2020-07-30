import Foundation

struct MainWorker: APIClient, MainWorking {
    
    var session: URLSession = URLSession(configuration: .default)
    
    func altynCurrency(endPoint: MainEndPoint, complition: @escaping (Result<AltynCurrencyResponse, NetworkError>) -> Void) {
        fetch(with: endPoint.request, completion: complition)
    }
    
    func atfbankCurrency(endPoint: MainEndPoint, complition: @escaping (Result<AtfbankCurrencyResponse, NetworkError>) -> Void) {
        fetch(with: endPoint.request, completion: complition)
    }
    
    func halkCurrency(endPoint: MainEndPoint, complition: @escaping (Result<HalykbankCurrencyResponse , NetworkError>) -> Void) {
        fetch(with: endPoint.request, completion: complition)
    }
}
