//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/10.
//

import Foundation

struct BodyCondition {
    private var _upperBodyStrength: Int = 0     /// 상체근력
    private var _lowerBodyStrength: Int = 0    /// 하체근력
    private var _muscularEndurance: Int = 0     /// 근지구력
    private var _fatigue: Int = 0              /// 피로도
    
    var upperBodyStrength: Int {
        get { return _upperBodyStrength }
        set { _upperBodyStrength = newValue }
    }
    
    var lowerBodyStrength: Int {
        get { return _lowerBodyStrength }
        set { _lowerBodyStrength = newValue }
    }
    
    var muscularEndurance: Int {
        get { return _muscularEndurance }
        set { _muscularEndurance = newValue }
    }
    
    var fatigue: Int {
        get { return _fatigue }
        set { _fatigue = max(newValue, 0) }
    }
}
