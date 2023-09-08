//
//  People.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/07.
//

import Foundation

class People {
    let name: String
    let bodyCondition: BodyCondition

    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
}

// MARK: - Public

extension People {
    var conditionMessage: String {
        var result = "현재의 컨디션은 다음과 같습니다.\n"
        result += bodyCondition.statusMessage
        result += "--------------"

        return result
    }

    func workout(_ activity: Activity) -> String {
        var result = "<<\(activity.name)을(를) 시작합니다>>\n"
        let oldCondition = bodyCondition.copy()
        activity.action(bodyCondition)
        result += bodyCondition.changeMessage(from: oldCondition)
        result += "--------------"

        return result
    }
}
