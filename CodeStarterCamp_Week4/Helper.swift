//
//  Helper.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/08.
//

import Foundation

extension String {
    func koreanFinalSyllable(has: String, not: String) -> Self {
        if self.count == 0 {
            return self
        }

        // https://developer.apple.com/documentation/foundation/nsregularexpression
        // https://www.unicode.org/Public/UCD/latest/ucd/PropertyValueAliases.txt
        let lastCharacter = String(self.suffix(1))
        if lastCharacter.range(of: "\\p{Hangul}", options: .regularExpression) == nil {
            return self
        }

        guard let unicodeScalar = UnicodeScalar(lastCharacter) else {
            return self
        }

        let characterValue = unicodeScalar.value - 0xAC00
        // let startSyllable = characterValue / 28 / 21
        // let vowelSyllable = (characterValue / 28) % 21
        let finalSyllable = characterValue % 28
        if finalSyllable > 0 {
            return "\(self)\(has)"
        }
        else {
            return "\(self)\(not)"
        }
    }
}
