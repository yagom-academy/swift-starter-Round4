//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 이준영 on 2022/07/19.
//

import Foundation

class BodyCondition {
    let name: String
    var upperBodyStrength: Int = 200 { // 한번에 들 수 있는 무게: 20kg인 상태일 때 200
        didSet {
            self.printChangeInCondition(property: "상체근력이", amountOfChange: (upperBodyStrength - oldValue))
        }
    }
    var lowerBodyStrength: Int = 200 {
        didSet {
            self.printChangeInCondition(property: "하체근력이", amountOfChange: (lowerBodyStrength - oldValue))
        }
    }
    var muscularEndurance: Int = 200 { // 지속적으로 들 수 있는 무게: 상체와 하체의 합보다 클 수 없게끔 계산식 설계할 것
        didSet {
            self.printChangeInCondition(property: "근지구력이", amountOfChange: (muscularEndurance - oldValue))
        }
    }
    var fatigue: Int = 0 {
        didSet {
            self.printChangeInCondition(property: "피로도가", amountOfChange: (fatigue - oldValue))
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func doActivity(_ activity: Activity) {
        if self.fatigue < 100 {
            print("<<\(activity.name)을(를) 시작합니다>>")
            activity.action(self)
        } else {
            print("\(self.name)은(는) 너무 피곤해서 \(activity.name)을(를) 할 수 없다.")
        }
        checkBodyCondition()
    }
    
    private func printChangeInCondition(property: String, amountOfChange: Int) {
        if amountOfChange > 0 {
            print("\(property) \(amountOfChange) 상승합니다.")
        } else {
            print("\(property) \((-1) * amountOfChange) 감소합니다.")
        }
    }
    
    func checkBodyCondition() {
        print(
        """
        --------------
        현재 \(self.name)의 컨디션은 다음과 같습니다.
        상체근력: \(self.upperBodyStrength)
        하체근력: \(self.lowerBodyStrength)
        근지구력: \(self.muscularEndurance)
        피로도: \(self.fatigue)
        --------------
        """
        )
    }
}
