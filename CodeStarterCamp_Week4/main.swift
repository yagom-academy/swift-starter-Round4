//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int = 0 {
        didSet(oldNum) {
            let num = self.상체근력 - oldNum
            if num > 0 {
                print("상체근력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("상체근력이 변하지 않았습니다.")
            } else {
                print("상체근력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    
    var 하체근력: Int = 0 {
        didSet(oldNum) {
            let num = self.하체근력 - oldNum
            if num > 0 {
                print("하체근력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("하체근력이 변하지 않았습니다.")
            } else {
                print("하체근력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    
    var 근지구력: Int = 0 {
        didSet(oldNum) {
            let num = self.근지구력 - oldNum
            if num > 0 {
                print("근지구력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("근지구력이 변하지 않았습니다.")
            } else {
                print("근지구력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    
    var 피로도: Int = 0 {
        didSet(oldNum) {
            let num = self.피로도 - oldNum
            if num > 0 {
                print("피로도가 \(num) 상승합니다.")
            } else if num == 0 {
                print("피로도가 변하지 않았습니다.")
            } else {
                print("피로도가 \(abs(num)) 하락합니다.")
            }
        }
    }
    
    func 상체근력수치변경(_ num: Int) {
        상체근력 += num
    }
    func 하체근력수치변경(_ num: Int) {
        하체근력 += num
    }
    func 근지구력수치변경(_ num: Int) {
        근지구력 += num
    }
    func 피로도수치변경(_ num: Int) {
        피로도 += num
    }
    
    func printCondition() {
        print("""
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(상체근력)
        하체근력: \(하체근력)
        근지구력: \(근지구력)
        피로도: \(피로도)
        --------------
        """)
    }
}

struct Activity {
        let name: String
        let action: (BodyCondition) -> Void
}

var bodyCondition = BodyCondition()

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.상체근력수치변경(Int.random(in: 10...20))
    bodyCondition.피로도수치변경(Int.random(in: 10...20))
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.하체근력수치변경(Int.random(in: 20...30))
    bodyCondition.피로도수치변경(Int.random(in: 10...20))
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.근지구력수치변경(Int.random(in: 20...30))
    bodyCondition.상체근력수치변경(Int.random(in: 5...10))
    bodyCondition.하체근력수치변경(Int.random(in: 5...10))
    bodyCondition.피로도수치변경(Int.random(in: 20...30))
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    bodyCondition.피로도수치변경(Int.random(in: (-10)...(-5)))
})

func doActivity(_ act: Activity) {
    print("<<\(act.name)을(를) 시작합니다>>")
    act.action(bodyCondition)
    print("--------------")
}

doActivity(윗몸일으키기)
doActivity(스쿼트)
doActivity(오래달리기)
doActivity(동적휴식)
bodyCondition.printCondition()
