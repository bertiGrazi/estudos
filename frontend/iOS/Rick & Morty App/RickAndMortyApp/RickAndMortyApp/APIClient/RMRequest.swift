//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 02/01/23.
//

import Foundation

/// Object that represents a singlet API call 
final class RMRequest {
    //Base url - API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    //Endpoint - Desired endpoint
    private let endpoint: RMEndpoint
    
    // Path components - Path components for API, if any
    private let pathComponents: [String]
    
    // Query parameters - Query components for API, if any
    /// Filter characters
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParameters.compactMap ({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///       - endpoint: Target endpoint
    ///       - pathComponents: Collection of Path components
    ///       - queryComponents: Collection of Query components
    init(endpoint: RMEndpoint,
         pathComponents: [String] = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharacterRequests = RMRequest(endpoint: .character)
}