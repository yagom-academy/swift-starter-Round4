//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var 상체근력: Int = 0 {
        didSet(oldValue) {
            print("상체근력이 \(상체근력 - oldValue) 상승합니다.")
        }
    }
    
    var 하체근력: Int = 0 {
        didSet(oldValue) {
            print("하체근력이 \(하체근력 - oldValue) 상승합니다.")
        }
    }
    
    var 근지구력: Int = 0 {
        didSet(oldValue) {
            print("근지구력이 \(근지구력 - oldValue) 상승합니다.")
        }
    }
    
    var 피로도: Int = 0 {
        didSet(oldValue) {
            if 피로도 > oldValue {
                print("피로도가 \(피로도 - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - 피로도) 하락합니다.")
            }
        }
    }
    
    func currentBodyCondition() {
        print("""
                --------------
                현재의 컨디션은 다음과 같습니다.
                상체근력: \(상체근력)
                하체근력: \(하체근력)
                근지구력: \(근지구력)
                피로도: \(피로도)
                -------------\n
                """)
    }
}

struct Activitiy {
    let name: String
    let action: (inout BodyCondition) -> Void
}

let 윗몸일으키기: Activitiy = Activitiy(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다>>")
    bodyCondition.상체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.currentBodyCondition()
})

let 스쿼트: Activitiy = Activitiy(name: "스쿼트", action: { bodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 20...30)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.currentBodyCondition()
})

let 런지: Activitiy = Activitiy(name: "런지", action: { bodyCondition in
    print("<<\(런지.name)을(를) 시작합니다>>")
    bodyCondition.하체근력 += Int.random(in: 10...20)
    bodyCondition.피로도 += Int.random(in: 10...20)
    bodyCondition.currentBodyCondition()
})

let 오래달리기: Activitiy = Activitiy(name: "오래달리기", action: { bodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다>>")
    bodyCondition.근지구력 += Int.random(in: 20...30)
    bodyCondition.상체근력 += Int.random(in: 5...10)
    bodyCondition.하체근력 += Int.random(in: 5...10)
    bodyCondition.피로도 += Int.random(in: 20...30)
    bodyCondition.currentBodyCondition()
})

let 동적휴식: Activitiy = Activitiy(name: "동적휴식", action: { bodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다>>")
    bodyCondition.피로도 -= Int.random(in: 5...10)
    bodyCondition.currentBodyCondition()
})

var exercise = BodyCondition()

윗몸일으키기.action(&exercise)
스쿼트.action(&exercise)
런지.action(&exercise)
오래달리기.action(&exercise)
동적휴식.action(&exercise)
