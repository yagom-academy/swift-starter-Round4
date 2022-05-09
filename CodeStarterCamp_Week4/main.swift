import Foundation

enum FitnessCenterError: Error {
    case Overfatigue
    case UnreachedGoal
    case InvaildInputValue
    case InvaildRoutine
    case NoMember
}

func inputToString() throws -> String {
    guard let input = readLine(),
              input.isEmpty == false,
              input.contains(" ") == false else {
        throw FitnessCenterError.InvaildInputValue
    }
    
    for character in input {
        guard character.isLetter else {
            throw FitnessCenterError.InvaildInputValue
        }
    }
    return input
}

func inputToInt() throws -> Int {
    guard let input = readLine(), let input  = Int(input) else {
        throw FitnessCenterError.InvaildInputValue
    }
    return input
}

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    mutating func exercise(for set: Int, _ routine: Routine, _ fatigueLimit: Int) throws {
        print("\(routine.name)을 \(set)set 시작합니다.")
        for _ in 1...set {
            try routine.doExercises(&bodyCondition, fatigueLimit)
        }
    }
}

struct FitnessCenter {
    let centerName: String
    var bodyConditionGoal: BodyCondition
    var member: Person?
    let routineList: [Routine]
    
    mutating func runFitnessCenter() {
        joinMember()
        setBodyConditionGoal()
        do {
            try doRoutine(chooseRoutine(from: routineList), for: setCountOfSets())
            try printRoutineResult()
        } catch FitnessCenterError.NoMember {
            print("센터에 회원이 없습니다.")
        } catch FitnessCenterError.UnreachedGoal {
            print("-------------------------")
            print("목표치에 도달하지 못했습니다. 현재 \(member!.name)님의 컨디션은 다음과 같습니다.")
            self.member?.bodyCondition.printBodyCondition()
            self.runFitnessCenter()
        } catch FitnessCenterError.Overfatigue {
            print("-------------------------")
            print("\(member!.name)님의 피로도가 \(member!.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
        } catch {
            print("예상치 못한 에러 \(error)")
        }
    }

    mutating func joinMember() {
        while true {
            do {
                print("안녕하세요. \(self.centerName)입니다. 회원님의 이름은 무엇인가요?")
                self.member = Person(name: try inputToString(), bodyCondition: initBodyCondition)
                break
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 문자로 입력해 주세요.")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
    }

    mutating func setBodyConditionGoal() {
        print("운동 목표치를 순서대로 알려주세요.")
        while true {
            do {
                print("상체근력 : ", terminator: "")
                self.bodyConditionGoal.changeUpperBodyStrength(by: try inputToInt())
                break
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 숫자로 입력해 주세요.")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
        while true {
            do {
                print("하체근력 : ", terminator: "")
                self.bodyConditionGoal.changeLowerBodyStrength(by: try inputToInt())
                break
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 숫자로 입력해 주세요.")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
        while true {
            do {
                print("근지구력 : ", terminator: "")
                self.bodyConditionGoal.changeMuscularEndurance(by: try inputToInt())
                break
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 숫자로 입력해 주세요.")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
        while true {
            do {
                print("한계 피로도 : ", terminator: "")
                self.bodyConditionGoal.changeFatigue(by: try inputToInt())
                break
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 숫자로 입력해 주세요.")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
    }
    
    func chooseRoutine(from routineList: [Routine]) -> Routine {
        while true {
            do {
                print("몇 번째 루틴으로 운동하시겠어요?")
                for (index, routine) in routineList.enumerated() {
                    print("\(index + 1). \(routine.name)")
                }
                let index = try inputToInt() - 1
                
                guard routineList.indices.contains(index) else {
                    throw FitnessCenterError.InvaildRoutine
                }
                return routineList[index]
            } catch FitnessCenterError.InvaildRoutine {
                    print("선택한 루틴이 없습니다. 다시 입력해 주세요.")
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 숫자로 입력해 주세요.")
            } catch {
                    print("에상치 못한 오류 \(error)")
            }
        }
    }
    
    func setCountOfSets() -> Int {
        while true {
            do {
                print("몇 세트 반복하시겠어요?")
                let countOfSets = try inputToInt()
                return countOfSets
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류. 숫자로 입력해 주세요.")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
    }
    
    mutating func doRoutine( _ routine: Routine, for set: Int) throws {
        while true {
            do {
                try self.member?.exercise(for: set, routine, bodyConditionGoal.fatigue)
            } catch FitnessCenterError.InvaildInputValue {
                print("입력값 오류")
            } catch {
                print("에상치 못한 오류 \(error)")
            }
        }
    }

    func printRoutineResult() throws {
        guard let member = self.member else {
            throw FitnessCenterError.NoMember
        }
        guard (member.bodyCondition.upperBodyStrength) >= (bodyConditionGoal.upperBodyStrength),
              (member.bodyCondition.lowerBodyStrength) >= (bodyConditionGoal.lowerBodyStrength),
              (member.bodyCondition.muscularEndurance) >= (bodyConditionGoal.muscularEndurance) else {
            throw FitnessCenterError.UnreachedGoal
        }
        print("-------------------------")
        print("성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
        member.bodyCondition.printBodyCondition()
    }
}

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    mutating func changeUpperBodyStrength(by number: Int) {
        self.upperBodyStrength += number
    }
    
    mutating func changeLowerBodyStrength(by number: Int) {
        self.lowerBodyStrength += number
    }
    
    mutating func changeMuscularEndurance(by number: Int) {
        self.muscularEndurance += number
    }
    
    mutating func changeFatigue(by number: Int) {
        self.fatigue += number
    }
    
    func printBodyCondition() {
        print("""
            현재의 컨디션은 다음과 같습니다.
            상체근력 : \(self.upperBodyStrength)
            하체근력 : \(self.lowerBodyStrength)
            근지구력 : \(self.muscularEndurance)
            피로도 : \(self.fatigue)
            """)
    }
}

struct Exercise {
    let name: String
    let action: (inout BodyCondition) -> Void
}

struct Routine {
    let name: String
    let exercises: [Exercise]
    
    func doExercises(_ bodyCondition: inout BodyCondition, _ fatigueLimit: Int) throws {
        print("-------------------------")
        for exercise in exercises {
            print("\(exercise.name)")
            exercise.action(&bodyCondition)
            if bodyCondition.fatigue > fatigueLimit {
                throw FitnessCenterError.Overfatigue
            }
        }
    }
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    $0.changeUpperBodyStrength(by: Int.random(in: 10...20))
    $0.changeFatigue(by: Int.random(in: 10...20))
}

let squad: Exercise = Exercise(name: "스쿼드") {
    $0.changeLowerBodyStrength(by: Int.random(in: 20...30))
    $0.changeFatigue(by: Int.random(in: 10...20))
}

let longDistanceRunning: Exercise = Exercise(name: "오래달리기") {
    $0.changeMuscularEndurance(by: Int.random(in: 20...30))
    $0.changeUpperBodyStrength(by: Int.random(in: 5...10))
    $0.changeLowerBodyStrength(by: Int.random(in: 5...10))
    $0.changeFatigue(by: Int.random(in: 20...30))
}

let activeRest: Exercise = Exercise(name: "동적휴식") {
    $0.changeFatigue(by: Int.random(in: -10 ... -5))
}

let legRaise: Exercise = Exercise(name: "레그레이즈") {
    $0.changeUpperBodyStrength(by: Int.random(in: 20...30))
    $0.changeLowerBodyStrength(by: Int.random(in: 20...30))
    $0.changeFatigue(by: Int.random(in: 10...20))
}

let burpee: Exercise = Exercise(name: "버피테스트") {
    $0.changeMuscularEndurance(by: Int.random(in: 20...30))
    $0.changeUpperBodyStrength(by: Int.random(in: 5...10))
    $0.changeLowerBodyStrength(by: Int.random(in: 5...10))
    $0.changeFatigue(by: Int.random(in: 20...30))
}

// step1 실행코드
/*
var myCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
let myExercises: [Exercise] = [sitUp, sitUp, activeRest, squad, squad, activeRest, longDistanceRunning, longDistanceRunning]
let myRoutine = Routine(name: "hellRoutine", exercises: myExercises)
myRoutine.doExercises(&myCondition)
myCondition.printBodyCondition()
*/

let initBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
let hellRoutineExercises: [Exercise] = [sitUp, sitUp, activeRest, legRaise, legRaise, activeRest, burpee, burpee]
let ohMyGodRoutineExercises: [Exercise] = [sitUp, squad, legRaise, burpee, activeRest]
let hellRoutine = Routine(name: "hellRoutine", exercises: hellRoutineExercises)
let ohMyGodRoutine = Routine(name: "ohMyGodRoutine", exercises: ohMyGodRoutineExercises)
let routineList: [Routine] = [hellRoutine, ohMyGodRoutine]
var yagomFitnessCenter = FitnessCenter(centerName: "야곰 피트니스 센터", bodyConditionGoal: initBodyCondition, member: nil, routineList: routineList)

yagomFitnessCenter.runFitnessCenter()
