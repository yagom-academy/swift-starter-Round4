//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int
    var 하체근력: Int
    var 근지구력: Int
    var 피로도: Int
    
    init(상체근력: Int, 하체근력: Int, 근지구력: Int, 피로도: Int) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {person in
    person.상체근력 += Int.random(in: 10...20)
    person.피로도 += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {person in
    person.하체근력 += Int.random(in: 20...30)
    person.피로도 += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {person in
    person.근지구력 += Int.random(in: 20...30)
    person.상체근력 += Int.random(in: 5...10)
    person.하체근력 += Int.random(in: 5...10)
    person.피로도 += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {person in
    person.피로도 -= Int.random(in: 5...10)
})

var personA: BodyCondition = BodyCondition(상체근력: 0, 하체근력: 0, 근지구력: 0, 피로도: 0)
