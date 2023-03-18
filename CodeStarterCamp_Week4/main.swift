//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var idinaloq: BodyCondition = BodyCondition(상체근력: 0, 하체근력: 0, 근지구력: 0, 피로도: 0)

var hellRoutine: Routine = Routine(routineName: "hellRoutine", activities: [윗몸일으키기, 스쿼트, 오래달리기])

hellRoutine.start(bodyCondition: idinaloq, routine: hellRoutine)
