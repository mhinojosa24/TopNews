//
//  ArticleModal.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/23/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit

enum Category: Int, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    var description: String {
        switch self {
        case .business: return "Business"
        case .entertainment: return "Entertainment"
        case .general: return "General"
        case .health: return "Health"
        case .science: return "Science"
        case .sports: return "Sports"
        case .technology: return "Tech"
        }
    }
}

struct Articles: Codable {
    var articles: [ArticleModal]?
}

struct ArticleModal: Codable {
    var author: String?
    var content: String?
    var description: String?
    var title: String?
    var urlToImage: String?
    
    init(author: String?, content: String?, description: String?, title: String?, urlToImage: String?, image: UIImage?){
        self.author = author
        self.content = content
        self.description = description
        self.title = title
        self.urlToImage = urlToImage
    }
}
