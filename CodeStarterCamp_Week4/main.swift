//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Copyright © yagom academy. All rights reserved.
//  Created by JeonSangHyeok on 2023/03/15.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class BodyCondition {
    var upperBodyStrength: Int = 0 {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int = 0 {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int = 0 {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int = 0 {
        didSet {
            if fatigue >= oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(fatigue - oldValue) 감소합니다.")
            }
        }
    }
    
    func checkCondition() {
        print("""
                --------------
                현재의 컨디션은 다음과 같습니다.
                상체근력: \(self.upperBodyStrength)
                하체근력: \(self.lowerBodyStrength)
                근지구력: \(self.muscularEndurance)
                피로도: \(self.fatigue)
                --------------
                """)
    }
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
    print("<<윗몸일으키기을(를) 시작합니다>>")
    BodyCondition.upperBodyStrength += Int.random(in: 10...20)
    BodyCondition.fatigue += Int.random(in: 10...20)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    print("<<스쿼트을(를) 시작합니다>>")
    BodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    BodyCondition.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { BodyCondition in
    print("<<오래달리기을(를) 시작합니다>>")
    BodyCondition.muscularEndurance += Int.random(in: 20...30)
    BodyCondition.upperBodyStrength += Int.random(in: 5...10)
    BodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    BodyCondition.fatigue += Int.random(in: 20...30)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    print("<<동적휴식을(를) 시작합니다>>")
    BodyCondition.fatigue -= Int.random(in: 5...10)
})

let 벤치프레스: Activity = Activity(name: "벤치프레스", action: { BodyCondition in
    print("<<벤치프레스을(를) 시작합니다>>")
    BodyCondition.upperBodyStrength += Int.random(in: 30...50)
    BodyCondition.fatigue += Int.random(in: 10...20)
})

let 레그프레스: Activity = Activity(name: "레그프레스", action: { BodyCondition in
    print("<<레그프레스을(를) 시자갑니다>>")
    BodyCondition.lowerBodyStrength += Int.random(in: 30...50)
    BodyCondition.fatigue += Int.random(in: 10...20)
})


let hyeokBodyCondition: BodyCondition = BodyCondition()


윗몸일으키기.action(hyeokBodyCondition)
스쿼트.action(hyeokBodyCondition)
오래달리기.action(hyeokBodyCondition)
벤치프레스.action(hyeokBodyCondition)
레그프레스.action(hyeokBodyCondition)
동적휴식.action(hyeokBodyCondition)

hyeokBodyCondition.checkCondition()


