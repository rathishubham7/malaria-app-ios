//
//  TodayViewController.swift
//  Malaria App Widget
//
//  Created by Teodor Ciuraru on 3/1/16.
//  Copyright © 2016 Bruno Henriques. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var noButton: UIButton!
  @IBOutlet weak var yesButton: UIButton!

  private var currentDate: NSDate = NSDate()
  @IBInspectable private let FullDateTextFormat: String = "M/d/yyyy"
  @IBInspectable private let MinorDateTextFormat: String = "EEEE"

  let widgetController: NCWidgetController = NCWidgetController.widgetController()

  override func viewDidLoad() {
    super.viewDidLoad()

    currentDate = NSDate()
    dayLabel.text = currentDate.formatWith(MinorDateTextFormat)
    dateLabel.text = currentDate.formatWith(FullDateTextFormat)
  }

  // Solves unnecesary widget bottom margin problem
  func widgetMarginInsetsForProposedMarginInsets(var defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
    defaultMarginInsets.bottom = 10.0;
    return defaultMarginInsets;
  }

  // Not doing anything yet, not even dismissing widget
  @IBAction func noPressed(sender: UIButton) {

  //    NSUserDefaults(suiteName: Constants.Widget.AppGroupBundleID)!.setObject(false, forKey: Constants.Widget.PillStatusUserDefaultsConstant)
  }

  @IBAction func yesPressed(sender: UIButton) {

    NSUserDefaults(suiteName: Constants.Widget.AppGroupBundleID)!.setObject(true, forKey: Constants.Widget.DidTakePillForToday)

    // dimiss widget
    widgetController.setHasContent(false, forWidgetWithBundleIdentifier: Constants.Widget.WidgetBundleID)
  }
}