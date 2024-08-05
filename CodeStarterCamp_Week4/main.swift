import Foundation

var crois: Person = Person(name: "crois", age: 24)
crois.근지구력 = Int.random(in: 50 ... 100)
crois.상체근력 = Int.random(in: 50 ... 100)
crois.하체근력 = Int.random(in: 50 ... 100)
crois.피로도 = 0
// 운동할 사람의 기초 설정

exerciseRoutine(in: crois, take: [윗몸일으키기,
                                  스쿼트,
                                  오래달리기,
                                  동적휴식])
