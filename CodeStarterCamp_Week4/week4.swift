class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigue: Int = 0
    
    init(upper: Int = 0, lower: Int = 0, muscular: Int = 0, fatigue: Int = 0) {
        upperBodyStrength = upper
        lowerBodyStrength = lower
        muscularEndurance = muscular
        self.fatigue = fatigue
    }
    
    func printCondition() {
        print("현재 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도 : \(fatigue)")
    }
}
