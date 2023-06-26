//
//  ImageCache.swift
//  T-Conect
//
//  Created by Kevin Hernandez on 15/06/23.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    private let cache = URLCache.shared
    
    func preloadImages(withURLs urls: [URL]) {
        for url in urls {
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
                let cachedRespone = CachedURLResponse(response: response!, data: data)
                self.cache.storeCachedResponse(cachedRespone, for: URLRequest(url: url))
            }
            .resume()
        }
    }
}
