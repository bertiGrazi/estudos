//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 04/01/23.
//
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
