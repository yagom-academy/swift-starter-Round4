//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printLine(length: Int) {
    let line: String = String(repeating: "-", count: length)
    print(line)
}

// 1. 몸의 상태를 체크하기 위해 BodyCondition 타입과 그 인스턴스를 생성합니다.
class BodyCondition {
    private var upperMuscle: Int = 0
    private var lowerMuscle: Int = 0
    private var stamina: Int = 0
    private var fatigue: Int = 0
    
    func enhanceMuscle(activity type: activityType) {
        print("<<\(type.name)을(를) 시작합니다.>>")
        var fatigueStat: Int = 0
        var activityInfo: [(activityType?, Int)] = []
        
        switch type {
        case activityType.situp:
            let randomStat: Int = getRandomMuscleStat(range: 10...20)
            activityInfo.append((type, randomStat))
            
            fatigueStat = getRandomMuscleStat(range: 10...20)
            activityInfo.append((nil, fatigueStat))
        case activityType.squat:
            let randomStat: Int = getRandomMuscleStat(range: 20...30)
            activityInfo.append((type, randomStat))
            
            fatigueStat = getRandomMuscleStat(range: 10...20)
            activityInfo.append((nil, fatigueStat))
        case activityType.running:
            var randomStat: Int
            
            randomStat = getRandomMuscleStat(range: 5...10)
            activityInfo.append((activityType.situp, randomStat))
            
            randomStat = getRandomMuscleStat(range: 5...10)
            activityInfo.append((activityType.squat, randomStat))
            
            randomStat = getRandomMuscleStat(range: 20...30)
            activityInfo.append((type, randomStat))
            
            fatigueStat = getRandomMuscleStat(range: 20...30)
            activityInfo.append((nil, fatigueStat))
        case activityType.rest:
            let randomStat: Int = getRandomMuscleStat(range: 5...10)
            let fatigueAfterRest: Int = self.fatigue - randomStat
            
            if fatigueAfterRest >= 0 {
                activityInfo.append((type,randomStat))
            } else {
                print("하락할 피로도가 없습니다.")
                self.fatigue = 0
            }
        }
        
        changeBodyCondition(muscleInfo: activityInfo)
    }
    
    private func getRandomMuscleStat(range: ClosedRange<Int>) -> Int {
        let randomStat: Int = Int.random(in: range)
        return randomStat
    }
    
    private func changeBodyCondition(muscleInfo: [(activityType?, Int)]) {
        for info in muscleInfo {
            let activityType: activityType? = info.0
            let randomStat: Int = info.1
            
            switch activityType {
            case .situp:
                print("상체근력이 \(randomStat) 상승합니다.")
                self.upperMuscle += randomStat
            case .squat:
                print("하체근력이 \(randomStat) 상승합니다.")
                self.lowerMuscle += randomStat
            case .running:
                print("근지구력이 \(randomStat) 상승합니다.")
                self.stamina += randomStat
            case .rest:
                print("피로도가 \(randomStat) 하락합니다.")
                self.fatigue -= randomStat
            default:
                print("피로도가 \(randomStat) 상승합니다.")
                self.fatigue += randomStat
            }
        }
    }
    
    func currentCondition() {
        printLine(length: 20)
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력 : \(self.upperMuscle)")
        print("하체근력 : \(self.lowerMuscle)")
        print("근지구력 : \(self.stamina)")
        print("피로도 : \(self.fatigue)")
        printLine(length: 20)
    }
}

enum activityType: CaseIterable {
    case situp
    case squat
    case running
    case rest
    
    var name: String {
        switch self {
        case .situp: return "윗몸일으키기"
        case .squat: return "스쿼트"
        case .running: return "오래달리기"
        case .rest: return "동적휴식"
        }
    }
    
    static func getActivityFromName(name: String) -> activityType? {
        let selectedActivity: activityType? = activityType.allCases.first{ "\($0.name)" == name }
        return selectedActivity
    }
}

// 2. Activity 타입을 활용해 다양한 활동 인스턴스를 생성합니다.
struct Activity {
    var name: String
    let action: (BodyCondition) -> Void
}

// 3. Activity 타입의 객체를 생성하고, action 클로저를 호출해 활동을 진행해봅시다
var activity: Activity = Activity(name: "", action: { bodyCondition in
    guard let type: activityType = activityType.getActivityFromName(name: activity.name) else {
        return
    }
    bodyCondition.enhanceMuscle(activity: type)
})

let bodyCondition: BodyCondition = BodyCondition()
for _ in 1...20 {
    if let randomActivity: activityType = activityType.allCases.randomElement() {
        let name: String = randomActivity.name
        activity.name = name
        activity.action(bodyCondition)
        
        // 4. 활동 후 현재의 몸 컨디션을 확인할 수 있는 메서드를 호출합니다.
        bodyCondition.currentCondition()
    }
}
