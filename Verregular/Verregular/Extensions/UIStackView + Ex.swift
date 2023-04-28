//
//  UIStackView + Ex.swift
//  Verregular
//
//  Created by Miroslav Deryuga on 22.04.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
