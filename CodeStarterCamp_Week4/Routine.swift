struct Routine {
    let name: String
    let activities: [Activity]
    
    init (name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    
    func start(bodyCondition: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요?")

        guard let prompt = readLine() else {
            throw RoutineError.invalidInput
        }
        
        guard let iteration = Int(prompt) else {
            throw RoutineError.invalidInput
        }
        
        if (iteration <= 0) {
            throw RoutineError.insufficientNumberInput
        } else {
            for i in 1...iteration {
                print("\(i) 번째 \(self.name)을(를) 시작합니다.")
                
                try activities.forEach {
                    $0.start(bodyCondition: bodyCondition)
                    
                    if bodyCondition.fatigueLevel > 100 {
                        throw RoutineError.exceedingFatigueLevel
                    }
                }
            }
            
            bodyCondition.showBodyCondition()
        }
    }
}

enum RoutineError: Error {
    case insufficientNumberInput
    case invalidInput
    case exceedingFatigueLevel
}
