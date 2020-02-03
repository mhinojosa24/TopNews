//
//  CategoryCollectionViewController.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/25/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit



class CategoryCollectionViewController: UICollectionViewController, ArticleContentUpdateDelegate {
    
    var articles = [ArticleModal]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1803921569, blue: 0.2745098039, alpha: 1)
        self.navigationItem.largeTitleDisplayMode = .never
        self.collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.cellId)
    }
    
    func articlesContentDidUpdate(articles: Articles?) {
        guard let articles = articles?.articles else { return }
        self.articles = articles
    }
    
    func fetch(articles: Router) {
        NetworkService.fetchArticles(category: articles) { (result) in
            
            self.articles = result.articles ?? []
     
        }
    }
}


extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    // NOTE: spacing for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // NOTE: size for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 + 150, height: view.frame.height / 2 - 235)
    }
    
    
    // NOTE: insets for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
    }
}

extension CategoryCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellId, for: indexPath) as! CategoryCell
        cell.title.text = articles[indexPath.row].title
        cell.urlToImage = articles[indexPath.row].urlToImage
        return cell
    }
}

