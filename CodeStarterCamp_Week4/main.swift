import Foundation

// BodyFit 타입 정의
struct BodyFit {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigueLevel: Int

    func showBodyFit() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueLevel)")
        print("--------------")
    }
}

// Exercise 타입 정의
struct Exercise {
    let name: String
    let performExercise: (inout BodyFit) throws -> Void
}

// Routine 타입 정의
struct Routine {
    let name: String
    let activities: [Exercise]

    func runRoutine(repeatCount: Int, bodyFit: inout BodyFit) throws {
        guard repeatCount > 0 else {
            throw RoutineError.invalidRepeatCount
        }

        for i in 1...repeatCount {
            print("\(i) 번째 \(name)을(를) 시작합니다.")

            for activity in activities {
                try activity.performExercise(&bodyFit)
            }

            if bodyFit.fatigueLevel >= 100 {
                print("피로도가 100 이상입니다. 루틴을 중단합니다.")
                break
            }

            bodyFit.showBodyFit()
        }
    }
}

// RoutineError 열거형 정의
enum RoutineError: Error {
    case invalidRepeatCount
}

// 활동 객체들 정의
let sitUp: Exercise = Exercise(name: "윗몸일으키기") { bodyFit in
    let increase = Int.random(in: 10...20)
    bodyFit.upperBodyStrength += increase
    bodyFit.fatigueLevel += Int.random(in: 10...20)
    showExerciseResult(sitUp.name, "상체근력", increase, "피로도", bodyFit.fatigueLevel)
}

let dynamicRest: Exercise = Exercise(name: "동적휴식") { bodyFit in
    let decrease = Int.random(in: 5...10)
    bodyFit.fatigueLevel -= decrease
    showExerciseResult(dynamicRest.name, "피로도", -decrease)
}

let squat: Exercise = Exercise(name: "스쿼트") { bodyFit in
    let increase = Int.random(in: 20...30)
    bodyFit.lowerBodyStrength += increase
    bodyFit.fatigueLevel += Int.random(in: 10...20)
    showExerciseResult(squat.name, "하체근력", increase, "피로도", bodyFit.fatigueLevel)
}

// Routine 객체 정의
let hellRoutine: Routine = Routine(name: "hellRoutine", activities: [sitUp, dynamicRest, squat])

// 활동 실행 결과 출력 함수
func showExerciseResult(_ exerciseName: String, _ values: Any...) {
    print("<<\(exerciseName)을(를) 시작합니다>>")

    for (index, value) in values.enumerated() {
        if let stringValue = value as? String {
            print("\(stringValue):", terminator: " ")
        } else if let intValue = value as? Int {
            if index % 2 == 0 {
                print("\(intValue)이(가) ", terminator: "")
            } else {
                print("\(abs(intValue)) \(intValue < 0 ? "하락" : "상승")합니다.", terminator: " ")
            }
        }
    }

    print("\n--------------")
}

// 현재의 몸 상태
var currentBodyFit = BodyFit(upperBodyStrength: 100, lowerBodyStrength: 70, muscularEndurance: 50, fatigueLevel: 10)

// 메인 루프
while true {
    print("루틴을 몇 번 반복할까요?")

    if let input = readLine(), let repeatCount = Int(input) {
        do {
            try hellRoutine.runRoutine(repeatCount: repeatCount, bodyFit: &currentBodyFit)
        } catch RoutineError.invalidRepeatCount {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch let error {
            print("오류 발생: \(error)")
        }
    } else {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
    }
}

