//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2022/01/06.
//
import Foundation

class FitnessCenter {
    let goalsBodyCondition: BodyCondition
    let member: Person?
    let routineList =  [upperBodyExcercises, lowerBodyExcercises]
   
    init(goalsBodyCondition: BodyCondition, member: Person) {
        self.goalsBodyCondition = goalsBodyCondition
        self.member = member

    }
    enum FitnessCenterError : Error {
        case inputError
        case noMember
    }
    
   
    func start() throws {
        guard member != nil else {
            throw FitnessCenterError.noMember }
        print("안녕하세요. 야곰피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let naming = readLine() else { return }
        guard let member = member else { return }
                member.name = naming
                print("\(member.name)님 환영합니다.")
    }
    
    func saveUpperbodystrength() throws {
      
        print("운동목표치를 순서대로 알려주세요 예시) 상체근력:130,하체근력:120,근지구력:150")
        print("상체근력:", terminator: " ")
        guard let strenth = readLine() else { return }
        guard let strenthInt = Int(strenth) else { return print("잘못입력하셨습니다.") }
        guard member != nil else{
            throw FitnessCenterError.inputError
        }
        guard strenthInt > 0 else {
                   throw FitnessCenterError.inputError
        }
        goalsBodyCondition.upperbodystrength = strenthInt
    }
  
    
    

    func saveLowerbodystrength() throws {
        print("하체근력:", terminator: " ")
        guard let strenth = readLine() else { return }
        guard let strenthInt = Int(strenth) else { return print("잘못입력하셨습니다.") }
        guard strenthInt > 0 else {
                   throw FitnessCenterError.inputError
               }
        goalsBodyCondition.lowerbodystrength = strenthInt
      
    }
    
    
    func saveMuscularendurance() throws{
        print("근지구력:", terminator: " ")
        guard let strenth = readLine() else { return }
        guard let strenthInt = Int(strenth) else { return print("잘못입력하셨습니다.") }
        guard strenthInt > 0 else {
                   throw FitnessCenterError.inputError
               }
        goalsBodyCondition.muscularendurance = strenthInt
       
    }
    func saveFatigue() throws {
        print("피로도:", terminator: " ")
        guard let faigue = readLine() else { return }
        guard let faigueInt = Int(faigue) else { return print("잘못입력하셨습니다.") }
        guard faigueInt > 0 else {
                   throw FitnessCenterError.inputError
               }
        goalsBodyCondition.fatigue = faigueInt
        
    }
    
    func finalGoalsBodyCondition() {
        guard let member = member else { return }
        print("""
              \(member.name)님의 목표는
              상체근력:\(goalsBodyCondition.upperbodystrength)
              하체근력:\(goalsBodyCondition.lowerbodystrength)
              근지구력:\(goalsBodyCondition.muscularendurance)
              """)
    }

    func saveExceptupperbodystrengh() {
  
        do{
             try  yagomFitnessCenter.saveUpperbodystrength()
        }catch FitnessCenterError.inputError{
              print("잘못입력하셨습니다.")
        }catch{}
    }
    
    func saveExceptFatigue() {
  
        do{
             try  yagomFitnessCenter.saveFatigue()
        }catch FitnessCenterError.inputError{
              print("잘못입력하셨습니다.")
        }catch{}
    }
    
    func saveExceptLowerbodystrength() {
  
        do{
             try  yagomFitnessCenter.saveLowerbodystrength()
        }catch FitnessCenterError.inputError{
              print("잘못입력하셨습니다.")
        }catch{}
    }
    
    func saveExceptMuscularendurance() {
  
        do{
             try  yagomFitnessCenter.saveMuscularendurance()
        }catch FitnessCenterError.inputError{
              print("잘못입력하셨습니다.")
        }catch{}
    }
    
    
    func noMemberCheck() {
  
        do{
             try  yagomFitnessCenter.start()
        }catch FitnessCenterError.noMember{
              print("사람이없습니다..")
        }catch{}
    }
    

      func handlilgUpperbodystrength() {
          goalsBodyCondition.upperbodystrength = -1
          repeat{
              saveExceptupperbodystrengh()
          } while goalsBodyCondition.upperbodystrength < 0
      }
      
      
      func handlilgLowerbodystrength() {
          goalsBodyCondition.lowerbodystrength = -1
          repeat{
              saveExceptupperbodystrengh()
          } while goalsBodyCondition.lowerbodystrength < 0
      }
      

      func handlilgMuscularendurance() {
          goalsBodyCondition.muscularendurance = -1
          repeat{
              saveExceptupperbodystrengh()
          } while goalsBodyCondition.muscularendurance < 0
      }
      

      func handlilgFatigue() {
          goalsBodyCondition.fatigue = -1
          repeat{
              saveExceptupperbodystrengh()
          } while goalsBodyCondition.fatigue < 0
      }
      
}

