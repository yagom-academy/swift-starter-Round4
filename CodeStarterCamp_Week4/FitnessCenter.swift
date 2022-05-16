import Foundation

class FitnessCenter {
    var name: String
    var routineList: [Routine]
    lazy var tablet = Tablet(name: name, routineList: routineList)
    var routineNumber: Int {
        return tablet.routineNumber
    }
    var routineSet: Int {
        return tablet.routineSet
    }
    var member: Person? {
        return tablet.member
    }
    var targetBodyCondition: BodyCondition? {
        return tablet.targetBodyCondition
    }

    init(name: String, routineList: [Routine]) {
        self.name = name
        self.routineList = routineList
    }

    func enrollExercise() {
        tablet.progressStep()
    }

    func doExercise() {
        var reachedTargetBodyCondition = false
        print("--------------------")
        print("\(routineList[routineNumber - 1].name)을 \(routineSet)set 시작합니다.")
        guard let member = member else { return }
        guard let targetBodyCondition = targetBodyCondition else { return }
        let routineCount = routineList[routineNumber - 1].routineOrder.count
        checkMemberExhausted(member: member, sets: routineSet, routineCount: routineCount)
        reachedTargetBodyCondition = didReachedTargetBodyCondition(member: member, condition: targetBodyCondition)
        if !reachedTargetBodyCondition {
            doExercise()
        }
        print("성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
        printCurrentBodyCondition(who: member)
    }

    func checkMemberExhausted(member: Person, sets: Int, routineCount: Int) {
        for _ in 1...sets {
            for count in 0..<routineCount {
                member.exercise(routine: routineList[routineNumber - 1], count: count)
                do {
                    try checkExausted(member: member)
                } catch WhileExercisingError.overFatigue {
                    let bodyCondition = member.bodyCondition
                    print("--------------------")
                    print("한계 피로도는 300입니다.")
                    print("\(member.name)님의 피로도가 \(bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                    exit(0)
                } catch {
                    print("알 수 없는 오류가 발생했습니다. 종료합니다")
                    exit(0)
                }
            }
        }
    }

    func didReachedTargetBodyCondition(member: Person, condition: BodyCondition) -> Bool {
        do {
            try checkReachedTargetBodyCondition(who: member, targetBodyCondition: condition)
            print("Success")
            return true
        } catch WhileExercisingError.unreachedTarget {
            print("--------------------")
            print("목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
            printCurrentBodyCondition(who: member)
            return false
        } catch {
            print(error)
            return false
        }
    }

    func printCurrentBodyCondition(who: Person) {
        print("상체근력: \(who.bodyCondition.upperBodyStrength)")
        print("하체근력: \(who.bodyCondition.lowerBodyStrength)")
        print("근지구력: \(who.bodyCondition.muscleEndurance)")
        print("피로도: \(who.bodyCondition.fatigue)")
    }
}
