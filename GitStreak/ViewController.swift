//
//  ViewController.swift
//  GitStreak
//
//  Created by Angela Dyrda on 12/9/16.
//  Copyright © 2016 AngelaDyrda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ConfirmationSegue" {
      let confirmationViewController = segue.destination as! ConfirmationViewController
      confirmationViewController.saveIncrement()
    }
  }

  @IBAction func unwindFromConfirmationView(_ segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }
}
