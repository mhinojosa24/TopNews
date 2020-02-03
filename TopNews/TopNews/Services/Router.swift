//
//  Router.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/23/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation


enum Router {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    func url() -> URL {
        switch self {
        case .business:
            return URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        case .entertainment:
            return URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        case .general:
            return URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        case .health:
            return URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        case .science:
            return URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        case .sports:
            return URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        case .technology:
            return URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=13c8c347e2644516be355fe1bb48c23a")!
        }
    }
}


