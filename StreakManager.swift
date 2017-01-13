import Foundation

class StreakManager {

  static var dateToday: Date = Date()
  static var lastCommitDate: Date = Date()

  class func validateCommit() {
    let lastCommit = StreakManager.lastCommitDate.timeIntervalSinceNow * -1.0

    guard lastCommit > 86400 else { return }
    UserDefaults.standard.set(StreakManager.lastCommitDate, forKey: "lastCommitDate")
  }

  class func dateYesterday() -> Date {
    let calendar = NSCalendar.current
    let dateComponents = NSDateComponents()
    dateComponents.day = -1
    let today:Date = dateToday
    guard let yesterday = calendar.date(byAdding: dateComponents as DateComponents, to: today as Date) else { return Date() }
    return yesterday
  }

  class func didCommitToday() -> Bool {
    return lastCommitDate == dateToday ? true : false
  }

  class func didCommitYesterday() -> Bool {
    return lastCommitDate == dateYesterday() ? true : false
  }
}
