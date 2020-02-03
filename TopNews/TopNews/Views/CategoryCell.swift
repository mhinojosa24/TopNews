//
//  CategoryCell.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/25/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit


class CategoryCell: UICollectionViewCell {
    
    static var cellId: String = "cellId"
    lazy var title: Label = self.createTitleLabel()
    lazy var imageView: CustomImage = self.createImage()
    var urlToImage: String! {
        didSet {
//            DispatchQueue.main.async {
                self.imageView.loadImage(urlString: self.urlToImage)
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCell {
    
    func createTitleLabel() -> Label {
        let label = Label.newLabel(title: "", textColor: .black, textSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        let labelHeight = label.optimalHeight
        label.frame = CGRect(x: label.frame.origin.x, y: label.frame.origin.y, width: label.frame.width, height: labelHeight)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }
    
    func createImage() -> CustomImage {
        let imageView = CustomImage()
        return imageView
    }
}


extension CategoryCell {
    func layout() {
        layoutImageView()
        layoutTitle()
    }
    
    func layoutTitle() {
        add(subview: title) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 10),
            v.leadingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            v.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -10),
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            ]}
    }
    
    func layoutImageView() {
        add(subview: imageView) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor, constant: 12),
            v.trailingAnchor.constraint(equalTo: p.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            v.widthAnchor.constraint(equalToConstant: p.frame.width / 2 - 20)
            ]}
    }
}
