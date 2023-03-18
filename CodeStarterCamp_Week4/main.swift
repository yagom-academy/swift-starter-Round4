//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by JeonSangHyeok on 2023/03/17.
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
            fatigue >= oldValue ? print("피로도가 \(fatigue - oldValue) 상승합니다.") : print("피로도가 \(fatigue - oldValue) 감소합니다.")
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

enum RoutineError: Error {
    case overLimitFatigue
    case overLimitRange
    case unexpectedInput
}

struct Person {
    var name: String
    var bodyCondition = BodyCondition()
    let roundCount = ["첫", "두", "세", "네", "다섯"]
    
    struct Routine {
        var routineName: String
        var activities: [Activity]
    }
    
    func startRoutine() {
        do {
            try getRoutineCount()
        } catch RoutineError.overLimitFatigue {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            print(bodyCondition.checkCondition())
        } catch RoutineError.overLimitRange {
            print("1에서 5사이의 숫자를 입력해주세요.")
        } catch RoutineError.unexpectedInput {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch {
            print("원인 모를 에러가 발생했습니다.")
        }
    }
    
    @discardableResult
    func getRoutineCount() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        guard let input = readLine(), let routineCount = Int(input)
        else {
            throw RoutineError.unexpectedInput
        }
        guard 0 < routineCount && routineCount < 6
        else {
            throw RoutineError.overLimitRange
        }
        try setRoutine(routineCount)
        return routineCount
    }
    
    func setRoutine(_ routineCount: Int) throws {
        let training = TrainingList()
        let routine = Routine(routineName: "일상루틴", activities: [training.레그프레스, training.윗몸일으키기, training.벤치프레스, training.스쿼트, training.오래달리기, training.동적휴식])
        print("--------------")
        for count in 0...routineCount {
            print("\(roundCount[count]) 번쨰 \(routine.routineName)을(를) 시작합나다.")
            for activity in routine.activities {
                print("<<\(activity.name)을(를) 시작합니다>>")
                activity.action(self.bodyCondition)
                print("--------------")
                if self.bodyCondition.fatigue >= 100 {
                    throw RoutineError.overLimitFatigue
                }
            }
        }
        bodyCondition.checkCondition()
    }
}

struct TrainingList {
    let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
        BodyCondition.upperBodyStrength += Int.random(in: 10...20)
        BodyCondition.fatigue += Int.random(in: 10...20)
    })
    
    let 스쿼트: Activity = Activity(name: "스쿼트", action: { BodyCondition in
        BodyCondition.upperBodyStrength += Int.random(in: 5...10)
        BodyCondition.lowerBodyStrength += Int.random(in: 20...30)
        BodyCondition.fatigue += Int.random(in: 10...20)
    })
    
    let 오래달리기: Activity = Activity(name: "오래달리기", action: { BodyCondition in
        BodyCondition.muscularEndurance += Int.random(in: 20...30)
        BodyCondition.upperBodyStrength += Int.random(in: 5...10)
        BodyCondition.lowerBodyStrength += Int.random(in: 5...10)
        BodyCondition.fatigue += Int.random(in: 20...30)
    })
    
    let 동적휴식: Activity = Activity(name: "동적휴식", action: { BodyCondition in
        BodyCondition.fatigue -= Int.random(in: 5...10)
    })
    
    let 벤치프레스: Activity = Activity(name: "벤치프레스", action: { BodyCondition in
        BodyCondition.upperBodyStrength += Int.random(in: 30...50)
        BodyCondition.fatigue += Int.random(in: 10...20)
    })
    
    let 레그프레스: Activity = Activity(name: "레그프레스", action: { BodyCondition in
        BodyCondition.lowerBodyStrength += Int.random(in: 30...50)
        BodyCondition.fatigue += Int.random(in: 10...20)
    })
}

let hyeok: Person = Person(name: "Hyeok")

hyeok.startRoutine()
