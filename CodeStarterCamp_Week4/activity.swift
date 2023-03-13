//
//  activity.swift
//  CodeStarterCamp_Week4
//
//  Created by JSB on 2023/03/13.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

//윗몸일으키기
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
    BodyCondition.상체근력 += Int.random(in: 10...20)
    BodyCondition.피로도 += Int.random(in: 10...20)
})

//스쿼트
let 스쿼트: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    BodyCondition.하체근력 += Int.random(in: 20...30)
    BodyCondition.피로도 += Int.random(in: 10...20)
})

//오래달리기
let 오래달리기: Activity = Activity(name: "오래달리기", action: { BodyCondition in
    BodyCondition.근지구력 += Int.random(in: 20...30)
    BodyCondition.상체근력 += Int.random(in: 5...10)
    BodyCondition.하체근력 += Int.random(in: 5...10)
    BodyCondition.피로도 += Int.random(in: 20...30)
})

//동적휴식
let 동적휴식: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    BodyCondition.피로도 -= Int.random(in: 5...10)
})

//종합운동
let 종합운동: Activity = Activity(name: "종합운동", action: { BodyCondition in
    BodyCondition.상체근력 += Int.random(in: 15...30)
    BodyCondition.하체근력 += Int.random(in: 25...40)
    BodyCondition.근지구력 += Int.random(in: 20...30)
    BodyCondition.피로도 += Int.random(in: 35...60)
})
