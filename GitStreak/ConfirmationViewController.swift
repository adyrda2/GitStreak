import Foundation
import UIKit

class ConfirmationViewController: UIViewController {
  let emitterLayer = CAEmitterLayer()

  override func viewDidLoad() {
    super.viewDidLoad()
    createEmitterLayer()
    createEmitterCell()
  }

  func createEmitterLayer() {
    emitterLayer.renderMode = kCAOnOrderIn
    emitterLayer.emitterPosition = CGPoint(x: 200.0, y: 50.0)
    self.view.layer.addSublayer(emitterLayer)
  }

  func createEmitterCell() {
    let emitterCell = CAEmitterCell()
    emitterCell.contents = UIImage(named: "square")?.cgImage
    emitterCell.birthRate = 20
    emitterCell.lifetime = 15.0
    emitterCell.color = greenColor()
    emitterCell.velocity = 50
    emitterCell.emissionRange = 4.0
    emitterLayer.emitterCells = [emitterCell]
  }

  func greenColor() -> CGColor {
    let color = UIColor(colorLiteralRed: 106.0/255.0, green: 255.0/255.0, blue: 17.0/255.0, alpha: 1).cgColor
    return color
  }
}