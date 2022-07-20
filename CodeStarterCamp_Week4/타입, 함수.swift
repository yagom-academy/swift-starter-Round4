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

enum Number: UInt {
    case 첫 = 1, 두, 세, 네, 다섯, 여섯, 일곱, 여덟, 아홉, 열, 열한, 열두, 열세, 열네, 열다섯
    
    var KoreanName: String {
        switch self {
        case .첫: return "첫"
        case .두: return "두"
        case .세: return "세"
        case .네: return "네"
        case .다섯: return "다섯"
        case .여섯: return "여섯"
        case .일곱: return "일곱"
        case .여덟: return "여덟"
        case .아홉: return "아홉"
        case .열: return "열"
        case .열한: return "열한"
        case .열두: return "열두"
        case .열세: return "열세"
        case .열네: return "열네"
        case .열다섯: return "열다섯"
        }
    }
}

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
        var OverFatigueLimit: Bool {
            return bodyConditionOfPerformer.fatigue > 100
        }
        print ("---------------------")
        
        guard numberOfSets != nil else {
            throw RoutineError.wrongInputValue
        }
        guard numberOfSets != "0" else {
            throw RoutineError.wrongInputValue
        }
        guard let numberOfSets = numberOfSets else {
            throw RoutineError.oterErrors
        }
        guard let numberOfSets = UInt(numberOfSets) else {
            throw RoutineError.wrongInputValue
        }
        
        for number in 1...numberOfSets {
            print("\(Number(rawValue: (number))?.KoreanName ?? "N")번째 \(self.routineName)을(를) 시작합니다")
            
            for index in 0...routineOrder.count-1 {
                routineOrder[index].action(bodyConditionOfPerformer)
                print("---------------------")
                guard OverFatigueLimit == false else {
                    throw RoutineError.fatigueOver100
                }
            }
        }
    }
}

func doRoutine(_ routine: Routine, for bodyConditionOfPerformer: BodyCondition) {
    do {
        try routine.repeatRoutine(for: bodyConditionOfPerformer)
        bodyConditionOfPerformer.checkBodyCondition()
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

