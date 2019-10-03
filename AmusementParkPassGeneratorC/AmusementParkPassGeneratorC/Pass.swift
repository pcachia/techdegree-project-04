//
//  Pass.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import Foundation

//A simple wrapper protocol. All passes (also those who might be added a later time) have to conform to this
protocol Swipeable {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [DiscountAccess] { get }
}

struct Pass: Swipeable {
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
}
