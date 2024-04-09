//
//  Double+Formatting.swift
//  GuidomiaQuantrics
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import Foundation

extension Double {
    var cleanString: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
