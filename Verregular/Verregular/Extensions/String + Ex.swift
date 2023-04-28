//
//  String + Ex.swift
//  Verregular
//
//  Created by Miroslav Deryuga on 23.04.2023.
//

import UIKit

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
