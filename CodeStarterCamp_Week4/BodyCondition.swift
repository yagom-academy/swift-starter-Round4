//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/10.
//

import Foundation

struct BodyCondition {
    private(set) var upperBodyStrength: Int = 0   /// 상체근력
    private(set) var lowerBodyStrength: Int = 0  /// 하체근력
    private(set) var muscularEndurance: Int = 0   /// 근지구력
    private(set) var fatigue: Int = 0      /// 피로도
    
    
    mutating func update(upperBodyStrength: Int? = nil,
                         lowerBodyStrength: Int? = nil,
                         muscularEndurance: Int? = nil,
                         fatigue: Int? = nil) {
        if let upperBodyStrength = upperBodyStrength {
            self.upperBodyStrength += upperBodyStrength
        }
        
        if let lowerBodyStrength = lowerBodyStrength {
            self.lowerBodyStrength += lowerBodyStrength
        }
        
        if let muscularEndurance = muscularEndurance {
            self.muscularEndurance += muscularEndurance
        }
        
        if let fatigue = fatigue {
            self.fatigue += fatigue
        }
    }

}
