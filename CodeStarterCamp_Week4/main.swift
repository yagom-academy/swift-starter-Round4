import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
        self.fatigue = fatigue
    }
    
    func tellCondition(afterRoutine: Routine) {
        afterRoutine.doExercise(by: self)
        print("""
            -----------------------
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(bodyCondition.upperBodyStrength)
            하체근력: \(bodyCondition.lowerBodyStrength)
            근지구력: \(bodyCondition.muscleEndurance)
            피로도: \(bodyCondition.fatigue)
            """)
    }
}

struct Exercise {
    let name: String
    var action: () -> Void
}

class Routine {
    let name: String
    var exercise = [Exercise]()
    
    init(name: String, exercise: [Exercise]) {
        self.name = name
        self.exercise = exercise
    }
    
    func tellMyExerciseRoutine() {
        print("""
            -----------------------
            \(self.name)을 시작합니다.
            """)
        for exerciseName in exercise {
           let extractExerciseName = exerciseName.name.map { String($0) }
           let exerciseName = extractExerciseName.joined(separator: "")
           print("\(exerciseName)")
        }
    }
    
    func doExercise(by who: BodyCondition) {
        tellMyExerciseRoutine()
        for didExercise in exercise {
            let exercised = didExercise.action
            exercised()
        }
    }
}

var bodyCondition:BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0)

let sitUp = Exercise(name: "윗몸일으키기", action: {
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squatt = Exercise(name: "스쿼트", action: {
    bodyCondition.lowerBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longDistanceRunning = Exercise(name: "오래달리기", action: {
    bodyCondition.muscleEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let activeRest = Exercise(name: "동적휴식", action: {
    bodyCondition.fatigue -= Int.random(in: 5...10)
})

let hellRoutine = Routine(name: "Hell-Routine", exercise: [sitUp, sitUp, squatt, squatt, activeRest, longDistanceRunning, longDistanceRunning])
var oneECondition: BodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 30, muscleEndurance: 40, fatigue: 10)

bodyCondition.tellCondition(afterRoutine: hellRoutine)
bodyCondition = oneECondition
oneECondition.tellCondition(afterRoutine: hellRoutine)
