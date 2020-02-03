//
//  ArticleCategoryCell.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/25/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit


class NewsStandCell: UICollectionViewCell {
    
    static let cellId: String = "NewsStandCell"
    lazy var titleLabel: Label = self.createTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NewsStandCell {
    func createTitleLabel() -> Label {
        let label = Label.newLabel(title: "", textColor: .black, textSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }
}

extension NewsStandCell {
    func updateUI() {
        self.backgroundColor = #colorLiteral(red: 0.6898397843, green: 0.6898397843, blue: 0.6898397843, alpha: 1)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
    }
    
    func layout() {
        layoutTitleLabel()
    }
    
    func layoutTitleLabel() {
        add(subview: titleLabel) { (v, p) in [
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 5),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor, constant: -5)
            ]}
    }
}
