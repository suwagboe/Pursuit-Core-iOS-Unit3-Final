//
//  string+extension.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension String {
    func leftPadding(toLength: Int, withPad: String = " ") -> String {

        guard toLength > withPad.count else { return self }

        let padding = String(repeating: withPad, count: toLength - withPad.count)
        return padding + self
    }
}
