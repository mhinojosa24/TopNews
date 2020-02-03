//
//  UIViewController.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/25/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // NOTE: This helper method creates and contraints to views
       func add(subview: UIView, createConstraints: (_ view: UIView, _ parent: UIView) -> [NSLayoutConstraint]) {
           addSubview(subview)
           
           subview.activate(constraints: createConstraints(subview, self))
           subview.layoutIfNeeded()
       }
    
       
       // NOTE: This funciton activates the given constraints
       func activate(constraints: [NSLayoutConstraint]) {
           translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate(constraints)
           
       }
}


