import Foundation

func exerciseRoutine(in person: BodyCondition, take exercise: [Activity]) {
    if person.피로도 < 100 {
        var exerciseNames: [String] = []
        
        for exerciseName in exercise {
            exerciseNames.append(exerciseName.name)
        }
        
        print(MagicNumber.blankPage)
        print("운동 루틴을 시작합니다.")
        print("##오늘의 운동 루틴##")
        print(exerciseNames.joined(separator: " -> "))
        
        while person.피로도 < 100 {
            for routine in exercise {
                guard person.피로도 < 100 else {
                    print(MagicNumber.blankPage)
                    print("피로도가 최대치에 도달하여 운동 루틴을 멈춥니다.")
                    break
                }
                routine.startExercise(person)
            }
        }
    } else {
        print("지금은 피로도가 가득해 운동을 시작할 수 없습니다.")
        print(MagicNumber.blankPage)
    }
    person.currentBodyCondition()
}
// 운동루틴을 설정하여, 피로도가 100이 될 때까지 루틴을 반복하는 함수
