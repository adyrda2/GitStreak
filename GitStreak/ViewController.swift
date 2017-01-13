import UIKit

class ViewController: UIViewController {
  var committed: Bool = false
  var dateToday: Date = Date()
  var lastCommitDate: Date = Date()

  @IBAction func yesButtonPressed(_ sender: UIButton) {
    let lastCommit = lastCommitDate.timeIntervalSinceNow * -1.0

    guard lastCommit > 86400 else { return }
    UserDefaults.standard.set(lastCommitDate, forKey: "lastCommitDate")
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let confirmationViewController = segue.destination as! ConfirmationViewController

    if !didCommitYesterday() {
      confirmationViewController.resetCounter()
    }
    else if !didCommitToday() {
      confirmationViewController.saveIncrement()
    }
  }

  @IBAction func unwindFromConfirmationView(_ segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }

  func dateYesterday() -> Date {
    let calendar = NSCalendar.current
    let dateComponents = NSDateComponents()
    dateComponents.day = -1
    let today:Date = dateToday
    guard let yesterday = calendar.date(byAdding: dateComponents as DateComponents, to: today as Date) else { return Date() }
    return yesterday
  }

  func didCommitToday() -> Bool {
    return lastCommitDate == dateToday ? true : false
  }

  func didCommitYesterday() -> Bool {
    return lastCommitDate == dateYesterday() ? true : false
  }
}
