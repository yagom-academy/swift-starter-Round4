import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var fatigue: Int
    var bodyConditionNamesInKorean: [String] = ["상체근력", "하체근력", "근지구력", "피로도"]

    func createRandomStrength(between range: ClosedRange<Int>) -> Int {

        return Int.random(in: range)
    }
}
