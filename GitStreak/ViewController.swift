import UIKit

class ViewController: UIViewController {
  var committed: Bool = false
  var dateToday: Date = Date()
  var lastCommitDate: Date = Date()
  
  @IBAction func yesButtonPressed(_ sender: UIButton) {
    lastCommitDate = dateToday
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard !didCommitToday() else { return }
        let confirmationViewController = segue.destination as! ConfirmationViewController
        confirmationViewController.saveIncrement()
  }

  @IBAction func unwindFromConfirmationView(_ segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }

  func nextDay() -> Date {
    let calendar = NSCalendar.current
    let dateComponents = NSDateComponents()
    dateComponents.day = 1
    let today:Date = dateToday
    guard let nextDay = calendar.date(byAdding: dateComponents as DateComponents, to: today as Date) else { return Date() }
    return nextDay
  }

  func didCommitToday() -> Bool {
    return lastCommitDate == dateToday ? true : false
  }
}
