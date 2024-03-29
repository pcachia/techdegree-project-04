//
//  ViewController.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TestSwipeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

          // MARK: - test Guest
//        //test Guest classic entrant
//        var guest = Guest(type: .classic)
//        let pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides], discountAccess: [.food(value: 0.1), .merchandise(value: 0.2)])
//        guest.pass = pass
//        //Will fail because the entrant has no access to the kitchen
//        let kitchenResult = guest.swipe(for: .kitchen)
//        print(kitchenResult)
//        //Will succeed
//        let amusementResult = guest.swipe(for: .amusement)
//        print(amusementResult)
//        // checking rides
//        let ridesResult = guest.swipe(for: .allRides)
//        print(ridesResult)
//        let skipLineResult = guest.swipe(for: .skipLine)
//        print(skipLineResult)
//        // checking discounts
//        let food = guest.swipe(for: .food(value: 0.1))
//        print(food)
        
          // MARK: - test Employee
//        //test Employee Food services entrant
//        var guest = Employee(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", type: .foodServices)
//        let pass = Pass(areaAccess: [.amusement, .kitchen], rideAccess: [.allRides], discountAccess: [.food(value: 0.15), .merchandise(value: 0.25)])
//        guest.pass = pass
//        //Will fail because the entrant has no access to the kitchen
//        let kitchenResult = guest.swipe(for: .kitchen)
//        print(kitchenResult)
//        //Will succeed
//        let amusementResult = guest.swipe(for: .amusement)
//        print(amusementResult)
//        // checking rides
//        let ridesResult = guest.swipe(for: .allRides)
//        print(ridesResult)
//        let skipLineResult = guest.swipe(for: .skipLine)
//        print(skipLineResult)
//        // checking discounts, will fail cause double does not match
//        let food = guest.swipe(for: .food(value: 0.1))
//        print(food)

          // MARK: - test Manager + BDay + 5secs
        //test guest Manager
        var guest = Manager(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", socialSecurityNumer: 123456, dateOfBirth: Dates.parse("2014-10-11"), type: .generalManager)
        let pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
        guest.pass = pass
        // Will succeed
        let kitchenResult = guest.swipe(for: .kitchen)
        print(kitchenResult)
        // Will succeed
        let amusementResult = guest.swipe(for: .amusement)
        print(amusementResult)
        // checking rides - succeed
        let ridesResult = guest.swipe(for: .allRides)
        print(ridesResult)
        // will fail
        let skipLineResult = guest.swipe(for: .skipLine)
        print(skipLineResult)
        // checking discounts - succeed
        let food = guest.swipe(for: .food(value: 0.25))
        print(food)
        // if guest's birth month and day are same as today, succeeds
        let hasBirthDay = guest.checkBirthday(for: guest.dateOfBirth)
        print(hasBirthDay)
        // if guest swipes within 5 seconds of a previous swipe it will print true (below 3 swipes that will seceed, not suceed, not succeed (false, true, true)
        checkTimer(for: nil, birthday: false)
        checkTimer(for: nil, birthday: false)
        checkTimer(for: nil, birthday: false)
    }
        
// MARK: - 5 Seconds Swipe Disable + Birthday check
    // TIMER -->
    // Variable that will hold a starting value of round seconds.
    var seconds: Int = 5
    // variable to store the timer instance
    var timer = Timer()
    // This will be used to make sure only one timer is created at a time.
    var isTimerRunning = false
    // function to start to run timer, function updateTimer() trigers every second
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    // function to update timer
    @objc func updateTimer() {
        // Decrements (count down) the seconds.
        seconds -= 1
        // if seconds is 0:
            // update TimerLabel.text with current seconds
            // stop timer
            // indicate that timer is currently not running
            // hide all arrow buttons
            // check if round answers if they are correct
            print("\(seconds) seconds left")
        // else :
            // update TimerLabel.text with current seconds
        if seconds == 0 {
            timer.invalidate()
            isTimerRunning = false
            resetTimer()
        }
    }
    // function to reset timer
    func resetTimer() {
        // reset seconds
        seconds = 5
        // run timer
        timer = Timer()
        // set timer is running to true
        isTimerRunning = false
    }
    
    // remove entrant questionmark on part two (used for data testing)
    func checkTimer(for entrant: Entrant?, birthday: Bool) {
        if isTimerRunning == true  {
            // remove if else on part two (used for data testing)
            if entrant == nil {
                print("swipe function locked! - TRUE")
            } else {
                //print("cannot run function while timer is running")
                // create the alert
                let alert = UIAlertController(title: "Already swiped", message: "You have already swiped this location, you may be able to swipe again at a later time.", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            
        } else {
            print("Swipe function running - FALSE")
            isTimerRunning = true
            runTimer()
            if birthday == true {
                // create the alert
                let alert = UIAlertController(title: "Happy Birthday!", message: "Wish you a great birthday at your favorite amusement park.", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // testing with button
    @IBAction func testSwipe(_ sender: Any) {
        var guest = Manager(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", socialSecurityNumer: 123456, dateOfBirth: Dates.parse("2014-10-11"), type: .generalManager)
        let pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
        guest.pass = pass
        let hasBirthDay = guest.checkBirthday(for: guest.dateOfBirth)
        checkTimer(for: guest, birthday: hasBirthDay)
    }
}

