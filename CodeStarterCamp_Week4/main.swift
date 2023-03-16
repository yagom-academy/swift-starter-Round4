//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


var myBody: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

var yourBody: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

윗몸일으키기.action(myBody)
스쿼트.action(myBody)
오래달리기.action(myBody)
동적휴식.action(myBody)
취침.action(myBody)

오래달리기.action(yourBody)
취침.action(yourBody)

