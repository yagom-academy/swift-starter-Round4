//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
        self.fatigue = fatigue
    }
    
    func checkCondition() {
        print("""
              현재의 컨디션은 다음과 같습니다.
              상체근력: \(self.upperBodyStrength)
              하체근력: \(self.lowerBodyStrength)
              근지구력: \(self.muscleEndurance)
              피로도: \(self.fatigue)
              ---------------
              """)
    }
}

//활동 타입
struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기 = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let strength = Int.random(in: 10...20)
    let fatigue = Int.random(in: 10...20)
    
    print("""
          <<윗몸일으키기을(를) 시작합니다>>
          상체근력이 \(strength) 상승합니다.
          피로도가 \(fatigue) 상승합니다.
          ---------------
          """)
    
    bodyCondition.upperBodyStrength += strength
    bodyCondition.fatigue += fatigue
    bodyCondition.checkCondition()
})

let 스쿼트 = Activity(name: "스쿼트", action: { bodyCondition in
    let strength = Int.random(in: 20...30)
    let fatigue = Int.random(in: 10...20)
    
    print("""
          <<스쿼트을(를) 시작합니다>>
          하체근력이 \(strength) 상승합니다.
          피로도가 \(fatigue) 상승합니다.
          ---------------
          """)
    
    bodyCondition.lowerBodyStrength += strength
    bodyCondition.fatigue += fatigue
    bodyCondition.checkCondition()
})

let 오래달리기 = Activity(name: "오래달리기", action: { bodyCondition in
    let muscleEndurance = Int.random(in: 20...30)
    let upperBodyStrength = Int.random(in: 5...10)
    let lowerBodyStrength = Int.random(in: 5...10)
    let fatigue = Int.random(in: 20...30)
    
    print("""
          <<오래달리기을(를) 시작합니다>>
          근지구력이 \(muscleEndurance) 상승합니다.
          상체근력이 \(upperBodyStrength) 상승합니다.
          하체근력이 \(lowerBodyStrength) 상승합니다.
          피로도가 \(fatigue) 상승합니다.
          ---------------
          """)
    
    bodyCondition.muscleEndurance += muscleEndurance
    bodyCondition.upperBodyStrength += upperBodyStrength
    bodyCondition.lowerBodyStrength += lowerBodyStrength
    bodyCondition.fatigue += fatigue
    bodyCondition.checkCondition()
})

let 동적휴식 = Activity(name: "동적휴식", action: { bodyCondition in
    var fatigue = Int.random(in: 5...10)
    
    if bodyCondition.fatigue <= fatigue {
        fatigue = bodyCondition.fatigue
    }
    
    print("""
          <<동적휴식을(를) 시작합니다>>
          피로도가 \(fatigue) 하락합니다.
          ---------------
          """)
    
    bodyCondition.fatigue -= fatigue
    bodyCondition.checkCondition()
})

let zion = BodyCondition(upperBodyStrength: 30, lowerBodyStrength: 30, muscleEndurance: 50, fatigue: 9)

윗몸일으키기.action(zion)
스쿼트.action(zion)
오래달리기.action(zion)
동적휴식.action(zion)
