enum RoutineError: Error {
    case exceedFatigueError
    case wrongValueError
}

class Routine {
    let routineName: String = "hellRoutine"
    let activities: [Activity] = [sitUp, squat, activeRest, longRun, activeRest]
    
    func countingRoutine(name: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요?")
        guard let input = readLine(), let routineNumber = Int(input) else { throw RoutineError.wrongValueError }
        print("--------------")
        for number in 1...routineNumber {
            print("\(number)번째 \(routineName)을 시작합니다.")
            for i in 0...activities.count - 1 {
                guard name.fatigue < 100 else { throw RoutineError.exceedFatigueError }
                activities[i].action(name)
            }
        }
    }
    
    func startRoutine(name: BodyCondition) {
        do {
            try countingRoutine(name: name)
        } catch RoutineError.exceedFatigueError {
            print("피로도 100 이상입니다. 루틴을 중단합니다.")
        } catch RoutineError.wrongValueError {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        } catch {
            print("에러 발생")
        }
        name.checkCurrentBodyCondition()
    }
}


