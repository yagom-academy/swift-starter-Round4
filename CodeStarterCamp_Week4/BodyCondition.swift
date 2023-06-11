//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by ChoiKwangWoo on 2023/06/10.
//

import Foundation

// 1. 몸의 상태를 체크하기 위해 BodyCondition 타입과 그 인스턴스를 생성합니다.
class BodyCondition {
    private var upperMuscle: Int = 0
    private var lowerMuscle: Int = 0
    private var stamina: Int = 0
    private var fatigue: Int = 0
    
    func enhanceMuscle(activityType: ActivityType) {
        print("<<\(activityType.name)을(를) 시작합니다.>>")
        
        var activityInfo: [(ActivityType?, Int)] = []
        
        var randomStat: Int
        var fatigueStat: Int
        var minRange: Int = 10
        var maxRange: Int = 20
        var minFatigue: Int = 10
        var maxFatigue: Int = 20
        
        switch activityType {
        case ActivityType.situp:
            randomStat = Int.random(in: minRange...maxRange)
            activityInfo.append((activityType, randomStat))
            
            fatigueStat = Int.random(in: minFatigue...maxFatigue)
            activityInfo.append((nil, fatigueStat))
        case ActivityType.squat:
            minRange = 20
            maxRange = 30
            
            randomStat = Int.random(in: minRange...maxRange)
            activityInfo.append((activityType, randomStat))
            
            fatigueStat = Int.random(in: minFatigue...maxFatigue)
            activityInfo.append((nil, fatigueStat))
        case ActivityType.running:
            minRange = 5
            maxRange = 10
            
            randomStat = Int.random(in: minRange...maxRange)
            activityInfo.append((ActivityType.situp, randomStat))
            randomStat = Int.random(in: minRange...maxRange)
            activityInfo.append((ActivityType.squat, randomStat))
            
            minRange = 20
            maxRange = 30
            randomStat = Int.random(in: minRange...maxRange)
            activityInfo.append((activityType, randomStat))
            
            minFatigue = 20
            maxFatigue = 30
            fatigueStat = Int.random(in: minRange...maxRange)
            activityInfo.append((nil, fatigueStat))
        case ActivityType.rest:
            minRange = 5
            maxRange = 10
            
            randomStat = Int.random(in: minRange...maxRange)
            let fatigueAfterRest: Int = self.fatigue - randomStat
            
            if fatigueAfterRest < 0 {
                print("하락할 피로도가 없습니다.")
                self.fatigue = 0
            } else {
                activityInfo.append((activityType, randomStat))
            }
        }
        try changeBodyCondition(muscleInfo: activityInfo)
    }
    
    private func changeBodyCondition(muscleInfo: [(ActivityType?, Int)]) {
        for info in muscleInfo {
            let activityType: ActivityType? = info.0
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
