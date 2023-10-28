//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

/* # TODO:
 - [0] BodyCondition 타입 생성
 - [0] 윗몸일으키기
 - [0] 스쿼트
 - [0] 오래달리기
 - [0] 동적휴식
 - [0] 잠
 */

class BodyCondition {
    var 상체근력: Int = Int.random(in: 1...50) {
        willSet {
            changeStatus(name: "상체근력", Value: newValue - self.상체근력)
        }
    }
    var 하체근력: Int = Int.random(in: 1...50) {
        willSet {
            changeStatus(name: "하체근력", Value: newValue - self.하체근력)
        }
    }
    var 근지구력: Int = Int.random(in: 1...50) {
        willSet {
            changeStatus(name: "근지구력", Value: newValue - self.근지구력)
        }
    }
    var 피로도: Int = 0
    {
       willSet {
           changeStatus(name: "피로도", Value: newValue - self.피로도)
       }
   }
    
    func checkBodyCondition () {
        print("------------------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.상체근력)")
        print("하체근력: \(self.하체근력)")
        print("근지구력: \(self.근지구력)")
        print("피로도: \(self.피로도)")
    }
}

func changeStatus (name: String, Value: Int) {
    if Value < 0 {
        print("\(name)이 \(-Value) 하락합니다.")
    } else {
        print("\(name)이 \(Value) 상승합니다.")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: {BodyCondition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다>>")
    BodyCondition.상체근력 += Int.random(in: 10...20)
    BodyCondition.피로도 += Int.random(in: 10...20)
})
    
let 스쿼트: Activity = Activity(name: "스쿼트", action: {BodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다>>")
    BodyCondition.하체근력 += Int.random(in: 10...20)
    BodyCondition.피로도 += Int.random(in: 10...20)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: {BodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다>>")
    BodyCondition.상체근력 += Int.random(in: 5...10)
    BodyCondition.하체근력 += Int.random(in: 5...10)
    BodyCondition.근지구력 += Int.random(in: 20...30)
    BodyCondition.피로도 += Int.random(in: 20...30)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: {BodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다>>")
    BodyCondition.피로도 -= Int.random(in: 5...10)
})

let 잠: Activity = Activity(name: "잠", action: {BodyCondition in
    print("<<\(잠.name)을(를) 시작합니다>>")
    BodyCondition.상체근력 -= Int.random(in: 5...10)
    BodyCondition.하체근력 -= Int.random(in: 5...10)
    BodyCondition.근지구력 -= Int.random(in: 5...10)
    BodyCondition.피로도 -= Int.random(in: 10...20)
})

let UDI = BodyCondition()
UDI.checkBodyCondition()
윗몸일으키기.action(UDI)
UDI.checkBodyCondition()
잠.action(UDI)
UDI.checkBodyCondition()
