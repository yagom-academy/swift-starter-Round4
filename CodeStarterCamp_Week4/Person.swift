//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by redmango1446 on 2023/03/23.
//

import Foundation

struct Person {
    var name : String
    var bodyCondition : BodyCondition = BodyCondition(upperBodyStrength: 10,
                                                      lowerBodyStrength: 10,
                                                      muscularEndurance: 10,
                                                      fatigue: 10)
    
    func changeStats(by action: String) {
        print("<<\(action)을(를) 시작합니다.>>")
        
        switch action {
            case "윗몸일으키기" :
                bodyCondition.upperBodyStrength += Int.random(in: 10...20)
                bodyCondition.fatigue += Int.random(in: 10...20)
            case "스쿼트" :
                bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
                bodyCondition.fatigue += Int.random(in: 10...20)
            case "오래달리기" :
                bodyCondition.muscularEndurance += Int.random(in: 20...30)
                bodyCondition.upperBodyStrength += Int.random(in: 5...10)
                bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
                bodyCondition.fatigue += Int.random(in: 20...30)
            case "동적휴식" :
                bodyCondition.fatigue -= Int.random(in: 5...10)
            default: print("아무것도 하지 않았으니 아무일도 일어나지 않습니다.")
        }
    }
}
