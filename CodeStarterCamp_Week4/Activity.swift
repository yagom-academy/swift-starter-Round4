//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Chaeeun Shin on 3/8/24.
//

struct Activity {
    let exercise: Exercise
    
    func takeExercise(with bodyCondition: BodyCondition) {
        print("<<\(self.exercise.rawValue)(을/를) 시작합니다>>")
        self.exercise.workOut(bodyCondition)
        print("--------------")
    }
}

enum Exercise: String, CaseIterable {
    case sitUp = "윗몸일으키기"
    case squat = "스쿼트"
    case running = "오래달리기"
    case rest = "동적휴식"
    
    var workOut: (BodyCondition) -> Void {
        switch self {
        case .sitUp:
            {
                let upperBodyMuscleStrengthIncrease = Int.random(in: 10...20)
                let fatigueIncrease = Int.random(in: 10...20)
                
                $0.upperBodyMuscleStrength += upperBodyMuscleStrengthIncrease
                $0.fatigue += fatigueIncrease
                
                print("""
                상체근력이 \(upperBodyMuscleStrengthIncrease) 상승합니다.
                피로도가 \(fatigueIncrease) 상승합니다.
                """)
            }
        case .squat:
            {
                let lowerBodyMuscleStrengthIncrease = Int.random(in: 20...30)
                let fatigueIncrease = Int.random(in: 10...20)
                
                $0.lowerBodyMuscleStrength += lowerBodyMuscleStrengthIncrease
                $0.fatigue += fatigueIncrease
                
                print("""
                하체근력이 \(lowerBodyMuscleStrengthIncrease) 상승합니다.
                피로도가 \(fatigueIncrease) 상승합니다.
                """)
            }
        case .running:
            {
                let muscularEnduranceIncrease = Int.random(in: 20...30)
                let upperBodyMuscleStrengthIncrease = Int.random(in: 5...10)
                let lowerBodyMuscleStrengthIncrease = Int.random(in: 5...10)
                let fatigueIncrease = Int.random(in: 20...30)
                
                $0.muscularEndurance += muscularEnduranceIncrease
                $0.upperBodyMuscleStrength += upperBodyMuscleStrengthIncrease
                $0.lowerBodyMuscleStrength += lowerBodyMuscleStrengthIncrease
                $0.fatigue += fatigueIncrease
                
                print("""
                근지구력이 \(muscularEnduranceIncrease) 상승합니다.
                상체근력이 \(upperBodyMuscleStrengthIncrease) 상승합니다.
                하체근력이 \(lowerBodyMuscleStrengthIncrease) 상승합니다.
                피로도가 \(fatigueIncrease) 상승합니다.
                """)
            }
        case .rest:
            {
                let fatigueDecrease = Int.random(in: 5...10)
                $0.fatigue -= fatigueDecrease
                
                print("""
                피로도가 \(fatigueDecrease) 감소합니다.
                """)
            }
        }
    }
}
