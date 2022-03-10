import Foundation

struct BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigue: Int = 0
    func checkBodyCondition() {
        print("""
              --------------
              현재 나의 컨디션은
              상체근력: \(upperBodyStrength)
              하체근력: \(lowerBodyStrength)
              근지구력: \(muscularEndurance)
              피로도: \(fatigue)
              """)
    }
}
struct Exercise {
    let name: String
    let action: () -> Void
}
var myBodyCondition: BodyCondition = BodyCondition()
let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: {
    myBodyCondition.upperBodyStrength += Int.random(in: 10...20)
    myBodyCondition.fatigue += Int.random(in: 10...20)
})
let squat: Exercise = Exercise(name: "스쿼트", action: {
    myBodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    myBodyCondition.fatigue += Int.random(in: 10...20)
})
let longRun: Exercise = Exercise(name: "오래달리기", action: {
    myBodyCondition.muscularEndurance += Int.random(in: 20...30)
    myBodyCondition.upperBodyStrength += Int.random(in: 5...10)
    myBodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    myBodyCondition.fatigue += Int.random(in: 20...30)
})
let activeRest: Exercise = Exercise(name: "동적휴식", action: {
    myBodyCondition.fatigue -= Int.random(in: 5...10)
})
struct Routine {
    var routineName: String
    var routineArray = Array<Exercise>()
    func startMyRoutine() {
        print("""
              --------------
              \(routineName)을 시작합니다.
              """)
        for routine in routineArray {
            print(routine.name)
            routine.action()
        }
    }
}
let myRoutine: Routine = Routine(routineName: "hellRoutine", routineArray: [sitUp, sitUp, squat, squat, activeRest, longRun])
myRoutine.startMyRoutine()
myBodyCondition.checkBodyCondition()
