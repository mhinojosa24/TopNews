//
//  NetworkService.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/23/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation

struct NetworkService {
    static func fetchArticles(category: Router, completion: @escaping (Articles) ->()) {
        
        URLSession.shared.dataTask(with: category.url()) { (data, response, error) in
            if error != nil {
                print("ERROR: \(error.debugDescription)")
            }
            
            if let response = response as? HTTPURLResponse, let data = data {
                print("RESPONSE: \(response.statusCode)")
                if response.statusCode == 200 {
                    do {
                        let articles = try JSONDecoder().decode(Articles.self, from: data)
                        DispatchQueue.main.async {
                            completion(articles)
                        }
                        
                    } catch let error as NSError {
                        print("ERROR: \(error)")
                    }
                }
            }
            
        }.resume()
    }
    
//    static func fetch(category: Router) -> [ArticleModal] {
//        fetchArticles(category: category) { (result) in
//            return result.articles ?? []
//        }
//    }
}
