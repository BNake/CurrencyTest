
import Foundation

struct API {
    static let baseURL = "?"
    static let gatewayURL = "?"
    static let devURL = "?"
}

protocol Endpoint {
    var path: String { get }
    var headers: HTTPHeaders { get }
    var parameters: RequestParameters? { get }
    var body: BodyParameters? { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        let queryItems = parameters?.compactMap {
            return URLQueryItem(name: $0.0, value: $0.1)
        }
        var components = URLComponents(string: path)!
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        
        if let body = body {
            urlRequest.httpBody = body.percentEscaped().data(using: .utf8)
        }
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
    
    var description: String {
        return """
        \n
        -------------- ENDPOINT --------------
        PATH: \(path)
        HEADERS: \(headers)
        PARAMETERS: \(parameters.debugDescription)
        BODY: \(body.debugDescription)
        METHOD: \(method)
        --------------------------------------
        """
    }
}

extension Endpoint {
        
    var headers: HTTPHeaders {
        return defaultHeaders
    }
    
    var defaultHeaders: HTTPHeaders {
        let defaultHeaders:[String:String] = ["Content-Type": "application/json"]
        return defaultHeaders
    }
    
    var authHeaders: HTTPHeaders {
        let authHeaders = self.defaultHeaders
        return authHeaders
    }
}

