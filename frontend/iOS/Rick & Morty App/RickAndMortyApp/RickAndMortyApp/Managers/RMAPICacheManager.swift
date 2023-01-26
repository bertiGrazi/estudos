//
//  RMAPICacheManager.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 26/01/23.
//

import Foundation

/// Manager in memory seassion scoped API caches
final class RMAPICacheManager {
    //API URL: Data
    
    private var cacheDisctionary: [
        RMEndpoint: NSCache<NSString, NSData>
    ] = [:]
    
    
    init() {
        setUpCache()
    }
    
    //MARK: - Public
    public func cachedResponse(for endpoint: RMEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDisctionary[endpoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for endpoint: RMEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDisctionary[endpoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
    
    //MARK: - Private
    private func setUpCache() {
        RMEndpoint.allCases.forEach({ endpoint in
            cacheDisctionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
}
