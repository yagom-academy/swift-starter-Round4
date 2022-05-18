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
                if bodyCondition.fatigue >= 100 {
                    print("\(name)님의 피로도가 \(bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                    break
                }
                routine.exercises[i].action()
                print(routine.exercises[i].name)
            }
        }
    }
    
}
