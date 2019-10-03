//
//  ViewController.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        //test Employee Food services entrant
        var guest = Employee(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", type: .foodServices)
        let pass = Pass(areaAccess: [.amusement, .kitchen], rideAccess: [.allRides], discountAccess: [.food(value: 0.15), .merchandise(value: 0.25)])
        guest.pass = pass
        //Will fail because the entrant has no access to the kitchen
        let kitchenResult = guest.swipe(for: .kitchen)
        print(kitchenResult)
        //Will succeed
        let amusementResult = guest.swipe(for: .amusement)
        print(amusementResult)
        // checking rides
        let ridesResult = guest.swipe(for: .allRides)
        print(ridesResult)
        let skipLineResult = guest.swipe(for: .skipLine)
        print(skipLineResult)
        // checking discounts, will fail cause double does not match
        let food = guest.swipe(for: .food(value: 0.1))
        print(food)

//        //test guest Manager
//        var guest = Manager(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", type: .manager)
//        let pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
//        guest.pass = pass
//        // Will succeed
//        let kitchenResult = guest.swipe(for: .kitchen)
//        print(kitchenResult)
//        // Will succeed
//        let amusementResult = guest.swipe(for: .amusement)
//        print(amusementResult)
//        // checking rides - succeed
//        let ridesResult = guest.swipe(for: .allRides)
//        print(ridesResult)
//        // will fail
//        let skipLineResult = guest.swipe(for: .skipLine)
//        print(skipLineResult)
//        // checking discounts - succeed
//        let food = guest.swipe(for: .food(value: 0.25))
//        print(food)

    }

}

