//
//  NewsStandCollectionViewController.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/25/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit


extension NewsStandCollectionViewController: UICollectionViewDelegateFlowLayout {
    // NOTE: spacing for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // NOTE: size for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 48, height: view.frame.height / 3 - 125)
    }
    
    
    // NOTE: insets for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 35, bottom: 25, right: 35)
    }
}

extension NewsStandCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let categoryVC = CategoryCollectionViewController(collectionViewLayout: layout)
        switch indexPath {
        case [0, 0]:
            categoryVC.title = Category.business.description
            categoryVC.fetch(articles: .business)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        case [0, 1]:
            categoryVC.title = Category.entertainment.description
            categoryVC.fetch(articles: .entertainment)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        case [0, 2]:
            categoryVC.title = Category.general.description
            categoryVC.fetch(articles: .general)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        case [0, 3]:
            categoryVC.title = Category.health.description
            categoryVC.fetch(articles: .health)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        case [0, 4]:
            categoryVC.title = Category.science.description
            categoryVC.fetch(articles: .science)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        case [0, 5]:
            categoryVC.title = Category.sports.description
            categoryVC.fetch(articles: .sports)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        case [0, 6]:
            categoryVC.title = Category.technology.description
            categoryVC.fetch(articles: .technology)
            self.navigationController?.pushViewController(categoryVC, animated: true)
        default:
            break
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsStandCell.cellId, for: indexPath) as! NewsStandCell
        cell.titleLabel.text = Category(rawValue: indexPath.row)?.description        
        return cell
    }
}

