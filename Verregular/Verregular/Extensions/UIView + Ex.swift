//
//  UIView + Ex.swift
//  Verregular
//
//  Created by Miroslav Deryuga on 22.04.2023.
//

import UIKit

extension UIView {
    func addSubViews(views: [UIView]) {
        views.forEach {view in
            addSubview(view)
            
        }
    }
}
