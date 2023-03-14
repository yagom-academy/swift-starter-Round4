//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
/*
var mint2 = BodyCondition(upperBodyStrength: 100, lowerBodyStrength: 100, muscularEndurance: 150, fatigability: 0)

윗몸일으키기.action(mint2)
스쿼트.action(mint2)
오래달리기.action(mint2)
동적휴식.action(mint2)
*/
var mom = BodyCondition(upperBodyStrength: 100, lowerBodyStrength: 110, muscularEndurance: 110, fatigability: 50)

동적휴식.action(mom)
동적휴식.action(mom)

var special = Routine(name: "특별한 운동", activities: [윗몸일으키기])

special.setRoutine(mom)
