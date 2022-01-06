import Foundation

struct BodyCondition {
    var upperBodyStrength = 0
    var lowerBodyStrength = 0
    var muscleEndurance = 0
    var fatigue = 0
}

var personalBodyCondition: BodyCondition = .init(upperBodyStrength: 100,
                                                 lowerBodyStrength: 100,
                                                 muscleEndurance: 100,
                                                 fatigue: 0)

struct Routine {
    var name: String
    var exercisesArray: [Exercise]
    
    init (name: String, exercisesArray: [Exercise]){
        self.name = name
        self.exercisesArray = exercisesArray
    }
    
    func executeRoutine() {
        print("--------------")
        print("\(self.name)을 시작합니다.")
        for element in 0..<exercisesArray.count{
            exercisesArray[element].action()
            print(exercisesArray[element].name)
        }
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("""
              상체근력: \(personalBodyCondition.upperBodyStrength)
              하체근력: \(personalBodyCondition.lowerBodyStrength)
              근지구력: \(personalBodyCondition.muscleEndurance)
              피로도: \(personalBodyCondition.fatigue)
              """)
    }
}

struct Exercise {
        var name: String
        let action: () -> Void
}

let randomNumberFiveToTen = Int.random(in: 5...10)
let randomNumberTenToTwenty = Int.random(in: 10...20)
let randomNumberTwentyTothirty = Int.random(in: 20...30)

let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: {
    personalBodyCondition.upperBodyStrength += randomNumberTenToTwenty
    personalBodyCondition.fatigue += randomNumberTenToTwenty
})

let squat: Exercise = Exercise(name: "스쿼트", action: {
    personalBodyCondition.lowerBodyStrength += randomNumberTwentyTothirty
    personalBodyCondition.fatigue += randomNumberTenToTwenty
})

let running: Exercise = Exercise(name: "오래달리기", action: {
    personalBodyCondition.muscleEndurance += randomNumberTwentyTothirty
    personalBodyCondition.upperBodyStrength += randomNumberFiveToTen
    personalBodyCondition.lowerBodyStrength += randomNumberFiveToTen
    personalBodyCondition.fatigue += randomNumberTwentyTothirty
})

let pushUp: Exercise = Exercise(name: "팔굽혀펴기", action: {
    personalBodyCondition.upperBodyStrength += randomNumberTwentyTothirty
    personalBodyCondition.lowerBodyStrength += randomNumberFiveToTen
    personalBodyCondition.fatigue += randomNumberTenToTwenty
})

let activeRest: Exercise = Exercise(name: "동적휴식", action: {
    personalBodyCondition.fatigue -= randomNumberFiveToTen
})

var mmimRoutine = Routine(name: "MMIM's Routine", exercisesArray: [squat, sitUp, running, pushUp, activeRest])
mmimRoutine.executeRoutine()
