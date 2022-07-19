import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet(upperBodyStrengthBeforeActivity) {
            print("상체근력이 \(upperBodyStrength - upperBodyStrengthBeforeActivity)만큼 증가했습니다")
        }
    }
    var lowerBodyStrength: Int {
        didSet(lowerBodyStrengthBeforeActivity) {
            print("하체근력이 \(lowerBodyStrength - lowerBodyStrengthBeforeActivity)만큼 증가했습니다")
        }
    }
    var muscularEndurance: Int {
        didSet(muscularEnduranceBeforeActivity) {
            print("근지구력이 \(muscularEndurance - muscularEnduranceBeforeActivity)만큼 증가했습니다")
        }
    }
    var fatigue: Int {
        didSet(fatigueBeforeActivity) {
            if fatigue > fatigueBeforeActivity {
                print("피로도가 \(fatigue - fatigueBeforeActivity)만큼 증가했습니다")
            } else if fatigue < fatigueBeforeActivity {
                print("피로도가 \(fatigueBeforeActivity - fatigue)만큼 감소했습니다")
            }
        }
    }
    
    init(upeerBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upeerBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkBodyCondition() {
        print("""
              현재의 컨디션은 다음과 같습니다
              상체근력: \(self.upperBodyStrength)
              하체근력: \(self.lowerBodyStrength)
              근지구력: \(self.muscularEndurance)
              피로도: \(self.fatigue)
              """)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {
    print("<<\(sitUp.name)을(를) 실행합니다>>")
    $0.upperBodyStrength += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
})

let squats : Activity = Activity(name: "스쿼트", action: {
    print("<<\(squats.name)을(를) 실행합니다>>")
    $0.lowerBodyStrength += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: {
    print("<<\(longRun.name)을(를) 실행합니다>>")
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 20...30)
})

let activeRest: Activity = Activity(name: "동적 휴식", action: {
    print("<<\(activeRest.name)을(를) 실행합니다>>")
    $0.fatigue -= Int.random(in: 20...30)
})

enum RoutineError: Error {
    case fatigueOver100
    case wrongInputValue
    case oterErrors
}

struct Routine {
    var routineName: String,
        routineOrder: [Activity]
    
    func repeatRoutine(for bodyConditionOfPerformer: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요?")
        let numberOfSets = readLine()
        let koreanNameOfNumber = [1: "첫", 2: "두", 3: "세", 4: "네", 5: "다섯", 6: "여섯", 7: "일곱", 8: "여덟", 9: "아홉", 10: "열", 11: "열 한", 12: "열 두", 13: "열 세", 14: "열 네", 15: "열 다섯"]
        var OverFatigueLimit: Bool {
            return bodyConditionOfPerformer.fatigue > 100
        }
        print ("---------------------")
        
        guard let numberOfSets = numberOfSets else {
            throw RoutineError.oterErrors
        }
        guard let numberOfSets = Int(numberOfSets) else {
            throw RoutineError.wrongInputValue
        }
        
        for `set` in 1...numberOfSets {
            guard let koreanNameOfNumber = koreanNameOfNumber[`set`] else {
                return print("가능한 셋트 수를 초과했습니다.")
            }
            print("\(koreanNameOfNumber) 번째 \(self.routineName)을(를) 시작합니다")
            
            for index in 0...routineOrder.count-1 {
                routineOrder[index].action(bodyConditionOfPerformer)
                print("---------------------")
                guard OverFatigueLimit == false else {
                    throw RoutineError.fatigueOver100
                }
            }
        }
        bodyConditionOfPerformer.checkBodyCondition()
    }
}

func doRoutine(_ routine: Routine, for bodyConditionOfPerformer: BodyCondition) {
    do {
        try routine.repeatRoutine(for: bodyConditionOfPerformer)
    } catch RoutineError.fatigueOver100 {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        bodyConditionOfPerformer.checkBodyCondition()
    } catch RoutineError.wrongInputValue {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        doRoutine(routine, for: bodyConditionOfPerformer)
    } catch RoutineError.oterErrors {
        print("알 수 없는 오류입니다 다시 시도해 주세요")
    } catch {
        print(error)
    }
}

