import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var muscleFatigue: Int = 0
}

struct Exercise {
    let name: String
    let action: () -> Void
}

struct Routine {
    let name: String
    let exercises: [Exercise]
}

func printOut(routine: Routine, person: BodyCondition) {
    print("-----------------")
    print("\(routine.name)을 시작합니다.")
    
    routine.exercises.forEach {
        print("\($0.name)")
        $0.action()
    }
    
    print("""
          -----------------
          현재의 컨디션은 다음과 같습니다.
          상체근력: \(person.upperBodyStrength)
          하체근력: \(person.lowerBodyStrength)
          근지구력: \(person.muscularEndurance)
          피로도: \(person.muscleFatigue)
          """)
}

let Minseong = BodyCondition()

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    Minseong.upperBodyStrength += Int.random(in: 10...20)
    Minseong.muscleFatigue += Int.random(in: 10...20)
}

let squat: Exercise = Exercise(name: "스쿼트") {
    Minseong.lowerBodyStrength += Int.random(in: 20...30)
    Minseong.muscleFatigue += Int.random(in: 10...20)
}

let longDistanceRunning: Exercise = Exercise(name: "오래달리기") {
    Minseong.muscularEndurance += Int.random(in: 20...30)
    Minseong.upperBodyStrength += Int.random(in: 5...10)
    Minseong.lowerBodyStrength += Int.random(in: 5...10)
    Minseong.muscleFatigue += Int.random(in: 20...30)
}

let activeRest: Exercise = Exercise(name: "동적휴식") {
    Minseong.muscleFatigue -= Int.random(in: 5...10)
}

let hellRoutine = Routine(name: "hellRoutine", exercises: [sitUp, sitUp, activeRest,
                                                           squat, squat, activeRest,
                                                           longDistanceRunning, longDistanceRunning])
printOut(routine: hellRoutine, person: Minseong)
