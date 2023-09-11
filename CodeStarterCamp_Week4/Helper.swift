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

extension Int {
    enum KoreanNumberStringStyle {
        case ordinal
        case cardinal
        case rankCardinal
    }

    func koreanNumberString(style: Int.KoreanNumberStringStyle) -> String {
        if self == 0 {
            return style == .ordinal ? "공" : "영"
        }

        let stepOrdinals = ["", "만", "억", "조", "경", "해", "자", "양", "구", "간", "정", "재", "극"]
        var number = self
        var step = 0
        var result = ""
        while number > 0 {
            let thousandNumber = number % 10000
            number = number / 10000
            if step == 0 {
                switch style {
                case .ordinal:
                    result = thousandNumber.koreanThousandOrdinal
                case .cardinal:
                    result = thousandNumber.koreanThousandCardinal(isRank: false)
                case .rankCardinal:
                    result = thousandNumber.koreanThousandCardinal(isRank: true)
                }
            }
            else if thousandNumber > 0 {
                result = thousandNumber.koreanThousandOrdinal + stepOrdinals[step] + result
            }
            step += 1
        }

        if result.hasPrefix("일만") {
            result.removeFirst()
        }
        return result.count == 0 ? "\(self)" : result
    }

    private var koreanThousandOrdinal: String {
        if self < 0 {
            return "\(self)"
        }
        else if self > 10000 {
            return "\(self)"
        }

        let oneDigit = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
        var twoDigit = oneDigit.map { $0 + "십" }
        twoDigit.replaceSubrange(0...1, with:["", "십"])
        var threeDigit = oneDigit.map { $0 + "백" }
        threeDigit.replaceSubrange(0...1, with:["", "백"])
        var fourDigit = oneDigit.map { $0 + "천" }
        fourDigit.replaceSubrange(0...1, with:["", "천"])

        let thousandNumber = (self % 10000) / 1000
        let hundredNumber = (self % 1000) / 100
        let tenNumber = (self % 100) / 10
        let oneNumber = self % 10

        return [fourDigit[thousandNumber],
                threeDigit[hundredNumber],
                twoDigit[tenNumber],
                oneDigit[oneNumber]].joined()
    }

    private func koreanThousandCardinal(isRank: Bool) -> String {
        switch self {
        case Self.min..<0 :
            fallthrough
        case 10001...Self.max :
            return "\(self)"
        case 1:
            return isRank ? "첫" : "하나"
        case 20:
            return "스무"
        default:
            break
        }

        let oneCardinals = ["", "한", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉"]
        let tenCardinals = ["", "열", "스물", "서른", "마흔", "쉰", "예순", "일흔", "여든", "아흔"]
        let ordinalNumber = (self % 10000) / 100 * 100
        let ordinalString = ordinalNumber.koreanThousandOrdinal
        let tenNumber = (self % 100) / 10
        let oneNumber = self % 10

        return [ordinalString,
                tenCardinals[tenNumber],
                oneCardinals[oneNumber]].joined()
    }
}
