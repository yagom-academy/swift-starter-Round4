import Foundation

class Person {
    var name: String
    var bodyCondition: BodyCondition
    
    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
    
    func exercise(for set: Int, routine: Routine) {
        print("--------------")
        print("\(routine.name)을 \(set)set 시작합니다.")
        for _ in 1...set {
            for i in 0..<routine.exercises.count {
                if self.bodyCondition.fatigue >= 100 {
                    break
                }
                print(routine.exercises[i].name)
                routine.exercises[i].action()
                print(bodyCondition)
            }
        }
    }
    
}
