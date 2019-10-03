//
//  Guest.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import Foundation

//The various entrant types 
struct Guest: Entrant, DateOfBirth {
    var type: GuestType
    var pass: Swipeable?
    var dateOfBirth: Date?
    
    func swipe(for area: AreaAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkAreaAccess(for: pass, and: area)
    }
    
    func swipe(for discount: DiscountAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkDiscountAccess(for: pass, and: discount)
    }
    
    func swipe(for ride: RideAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkRideAccess(for: pass, and: ride)
    }
}

struct Employee: Entrant, Nameable, Address {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var type: EmployeeType
    var pass: Swipeable?
    
    func swipe(for area: AreaAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkAreaAccess(for: pass, and: area)
    }
    
    func swipe(for discount: DiscountAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkDiscountAccess(for: pass, and: discount)
    }
    
    func swipe(for ride: RideAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkRideAccess(for: pass, and: ride)
    }
}

struct Manager: Entrant, Nameable, Address {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var type: ManagerType
    var pass: Swipeable?
        
    func swipe(for area: AreaAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkAreaAccess(for: pass, and: area)
    }
    
    func swipe(for discount: DiscountAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkDiscountAccess(for: pass, and: discount)
    }
    
    func swipe(for ride: RideAccess) -> Bool {
        guard let pass = pass else { return false }
        
        let kiosk = Kiosk()
        return kiosk.checkRideAccess(for: pass, and: ride)
    }
}

//struct Vendor: Entrant, Nameable, DateOfBirth, NameableVendor, DateOfVisit {
//    var firstName: String
//    var lastName: String
//    var dateOfBirth: Date?
//    var vendorName: String
//    var dateOfVisit: Date
//    var type: VendorType
//    var pass: Swipeable?
//
//    func swipe(for area: AreaAccess) -> Bool {
//        guard let pass = pass else { return false }
//
//        let kiosk = Kiosk()
//        return kiosk.checkAreaAccess(for: pass, and: area)
//    }
//
//    func swipe(for discount: DiscountAccess) -> Bool {
//        guard let pass = pass else { return false }
//
//        let kiosk = Kiosk()
//        return kiosk.checkDiscountAccess(for: pass, and: discount)
//    }
//
//    func swipe(for ride: RideAccess) -> Bool {
//        guard let pass = pass else { return false }
//
//        let kiosk = Kiosk()
//        return kiosk.checkRideAccess(for: pass, and: ride)
//    }
//}
