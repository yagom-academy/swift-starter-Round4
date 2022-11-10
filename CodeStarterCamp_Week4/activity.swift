//
//  Actibity.swift
//  CodeStarterCamp_Week4
//
//  Created by 서진 on 2022/11/10.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.nowBodyCondition()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.nowBodyCondition()
})

let 런지: Activity = Activity(name: "런지", action: { bodyCondition in
    print("<<\(런지.name)을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.nowBodyCondition()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다>>")
    bodyCondition.근지구력 += Int.random(in: 20...30)
    bodyCondition.상체근력 += Int.random(in: 5...10)
    bodyCondition.하체근력 += Int.random(in: 5...10)
    bodyCondition.피로도 += Int.random(in: 20...30)
    bodyCondition.nowBodyCondition()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다>>")
    bodyCondition.피로도 -= Int.random(in: 5...10)
    bodyCondition.nowBodyCondition()
})
