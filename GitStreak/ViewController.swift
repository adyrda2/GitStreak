import UIKit

class ViewController: UIViewController {

  @IBAction func yesButtonPressed(_ sender: UIButton) {
    StreakManager.validateCommit()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let confirmationViewController = segue.destination as! ConfirmationViewController
    if !StreakManager.didCommitYesterday() {
      confirmationViewController.resetCounter()
    }
    else if !StreakManager.didCommitToday() {
      confirmationViewController.saveIncrement()
    }
  }

  @IBAction func unwindFromConfirmationView(_ segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }
}
