//
//  AsyncCodeFetcher.swift
//  AsyncCode
//
//  Created by Andros Slowley on 3/30/22.
//

import Foundation
import UIKit

protocol AsyncCodeFetching {
    func fetchContent(_ url: String, completion: @escaping ([AsyncCodeModel], Error?) -> ())
}


final class AsyncCodeFetcher: AsyncCodeFetching {

    enum State {
        case fetching
        case ready
    }

    let session = URLSession.shared
    var state: State = .ready
    var queue = [String: URLSessionDataTask]()
    var cache = NSCache<NSString, UIImage>()
    
    func fetchContent(_ url: String, completion: @escaping ([AsyncCodeModel], Error?) -> ()) {
        guard state == .ready else { return }
        state = .fetching
        guard let url = URL(string: url) else {
            return
        }
        
        session.dataTask(with: url) { [weak self ] (data, response, error) in
            DispatchQueue.main.async {
                guard error != nil else {
                    completion([], error!)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode([AsyncCodeModel].self, from: data)
                    completion(model, nil)
                    self?.state = .fetching
                } catch(let decodeError ) {
                    completion([], decodeError)
                }
            }
        }.resume()
    }
 
    func fetchImage(_ url: String, completion: @escaping (UIImage?, Error?) -> ()) {
        
        guard queue[url] == nil else {
            return
        }
        
        if let image = cache.object(forKey: NSString(string: url)) {
            completion(image, nil)
        } else {
            let task = session.dataTask(with: URL(string: url)!) { data, response, error in
                guard error != nil else {
                    completion(nil, error!)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    let image = UIImage(data: data)
                    self?.cache.setObject(image!, forKey: NSString(string: url))
                    completion(image!, nil)
                    self?.queue[url] = nil
                }
            }
            task.resume()
            queue[url] = task
        }
    }
    
    func fetchImages(_ url: [String], completion: @escaping ([UIImage], Error?) -> ()) {
        var existingImages = [UIImage]()
        var nonExisting = [String]()
        url.forEach {
            if let image = cache.object(forKey: NSString(string: $0)) {
                existingImages.append(image)
            } else {
                nonExisting.append($0)
            }
        }

        if !existingImages.isEmpty {
            completion(existingImages, nil)
        }
        guard !nonExisting.isEmpty else {
            return
        }
        url.forEach { (path) in
            let task = session.dataTask(with: URL(string: path)!) { data, response, error in
                guard error != nil else {
                    completion([], error!)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    let image = UIImage(data: data)
                    self?.cache.setObject(image!, forKey: NSString(string: path))
                    completion([image!], nil)
                    self?.queue[path] = nil
                }
            }
            task.resume()
            queue[path] = task
        }
    }
    
    func cancelRequest(_ url: [String]) {
        url.forEach {
            queue[$0]?.cancel()
            queue[$0] = nil
        }
    }
}
