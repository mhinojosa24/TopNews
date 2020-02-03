//
//  ViewController.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/23/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import UIKit

class NewsStandCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationUI()
        self.collectionView.backgroundColor = #colorLiteral(red: 0.05793776789, green: 0.1025840152, blue: 0.1569653877, alpha: 1)
        self.collectionView.register(NewsStandCell.self, forCellWithReuseIdentifier: NewsStandCell.cellId)
    }
    
    
    
    func setupNavigationUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "News Stand"
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}


