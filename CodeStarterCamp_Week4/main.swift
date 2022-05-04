import Foundation

struct Routine {
    let name: String
    var exercises: Array<Exercise>
    
    func start() {
        print("hellRoutine을 시작합니다.")
        for exercise in exercises {
            exercise.action()
            print(exercise.name)
        }
    }
}

var player = BodyCondtion(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, tiredness: 0)
let exercises : Array<Exercise> = [sitUP, sitUP, activeRest, Squatting, Squatting, activeRest, longRun, longRun]
var hellRoutine = Routine(name: "hellRoutine", exercises: exercises)

hellRoutine.start()
player.checkCondition()
