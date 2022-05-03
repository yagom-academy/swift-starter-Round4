import Foundation

struct BodyCondition {
    var 상체근력: Int = 0
    var 하체근력: Int = 0
    var 근지구력: Int = 0
    var 피로도: Int = 0
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
        print("\(name)을 시작합니다.")

        for exercise in exercises {
            print("\(exercise.name)")
            exercise.action(&bodyCondition)
        }
        print("-------------------------")
    }
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기") {
    $0.상체근력 += Int.random(in: 10...20)
    $0.피로도 += Int.random(in: 10...20)
}

let 스쿼드: Exercise = Exercise(name: "스쿼드") {
    $0.하체근력 += Int.random(in: 20...30)
    $0.피로도 += Int.random(in: 10...20)
}

let 오래달리기: Exercise = Exercise(name: "오래달리기") {
    $0.근지구력 += Int.random(in: 20...30)
    $0.상체근력 += Int.random(in: 5...10)
    $0.하체근력 += Int.random(in: 5...10)
    $0.피로도 += Int.random(in: 20...30)
}

let 동적휴식: Exercise = Exercise(name: "동적휴식") {
    $0.피로도 -= Int.random(in: 5...10)
}

var myCondition = BodyCondition()
let myExercises: [Exercise] = [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼드, 스쿼드, 동적휴식, 오래달리기, 오래달리기]
let myRoutine = Routine(name: "hellRoutine", exercises: myExercises)
myRoutine.doExercises(&myCondition)

print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력 : \(myCondition.상체근력)
    하체근력 : \(myCondition.하체근력)
    근지구력 : \(myCondition.근지구력)
    피로도 : \(myCondition.피로도)
    """)
