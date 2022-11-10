import Foundation


func printResult(activity: Activity) {
    activity.action(bodyCondition)
    bodyCondition.printCondtion()
}

var bodyCondition = BodyCondition()
printResult(activity: squart)



