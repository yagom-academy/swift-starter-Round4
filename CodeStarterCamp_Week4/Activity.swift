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
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<윗몸일으키기를 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
})

//스쿼트
let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<스쿼트를 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 10...20)
})

//오래달리기
let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<오래달리기를 시작합니다>>")
    bodyCondition.근지구력 += Int.random(in: 20...30)
    bodyCondition.상체근력 += Int.random(in: 5...10)
    bodyCondition.하체근력 += Int.random(in: 5...10)
    bodyCondition.피로도 += Int.random(in: 20...30)
})

//동적휴식
let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<동적휴식을 시작합니다>>")
    bodyCondition.피로도 -= Int.random(in: 5...10)
})

//종합운동
let 종합운동: Activity = Activity(name: "종합운동", action: { bodyCondition in
    print("<<종합운동을 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 15...30)
    bodyCondition.하체근력 += Int.random(in: 25...40)
    bodyCondition.근지구력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 35...60)
})
