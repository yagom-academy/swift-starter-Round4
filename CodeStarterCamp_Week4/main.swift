import Foundation

enum FitnessCenterError: Error {
    case Overfatigue
    case UnreachedGoal
    case InvaildInputValue
    case NoMember
    case OtherExeption
}

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    mutating func exercise(for set: Int, _ routine: Routine) {
        print("\(routine.name)을 \(set)set 시작합니다.")
        for _ in 1...set {
            routine.doExercises(&bodyCondition)
        }
    }
}

struct FitnessCenter {
    let centerName: String
    var bodyGoal: BodyCondition
    var member: Person?
    let routineList: [Routine]
    
    mutating func trainMember() {
        joinMember()
        setBodyGoal()
        doRoutine(from: routineList)
    }
    
    mutating func joinMember() {
        print("안녕하세요. \(self.centerName)입니다. 회원님의 이름은 무엇인가요?")
        guard let memberName = readLine() else {
            return
        }
        member = Person(name: memberName, bodyCondition: initBodyCondition)
    }
    
    mutating func setBodyGoal() {
            print("운동 목표치를 순서대로 알려주세요.")
            print("상체근력 : ", terminator: "")
            self.bodyGoal.upperBodyStrength = Int(readLine()!)!
            print("하체근력 : ", terminator: "")
            self.bodyGoal.lowerBodyStrength = Int(readLine()!)!
            print("근지구력 : ", terminator: "")
            self.bodyGoal.muscularEndurance = Int(readLine()!)!
            print("피로도 : ", terminator: "")
            self.bodyGoal.fatigue = Int(readLine()!)!
        }
    
    mutating func doRoutine(from routineList: [Routine]) {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for (index, routine) in routineList.enumerated() {
            print("\(index+1). \(routine.name)")
        }
        let routineNumber = Int(readLine()!)! - 1
        
        print("몇 세트 반복하시겠어요?")
        let numberOfSets = Int(readLine()!)!
        
        self.member?.exercise(for: numberOfSets, routineList[routineNumber])
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
    
    func doExercises(_ bodyCondition: inout BodyCondition) {
        print("-------------------------")

        for exercise in exercises {
            print("\(exercise.name)")
            exercise.action(&bodyCondition)
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

var yagomFitnessCenter = FitnessCenter(centerName: "야곰 피트니스 센터", bodyGoal: initBodyCondition, member: nil, routineList: routineList)

yagomFitnessCenter.trainMember()
