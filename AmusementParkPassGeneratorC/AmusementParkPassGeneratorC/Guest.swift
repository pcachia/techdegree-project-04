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

struct Employee: Entrant, Nameable, Address, SocialSecurityNumber, DateOfBirth {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var socialSecurityNumer: Int
    var dateOfBirth: Date?
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

struct Manager: Entrant, Nameable, Address, SocialSecurityNumber, DateOfBirth {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var socialSecurityNumer: Int
    var dateOfBirth: Date?
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
    
    func checkBirthday(for entrant: Date?) -> Bool {
        guard let hasBirthday = dateOfBirth else { return false }
        
        // getting today's date
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let todayNumberOfDay = Int(dateFormatter.string(from: now))
        dateFormatter.dateFormat = "MM"
        let todayNumberOfMonth = Int(dateFormatter.string(from: now))
        // getting entrant's birth date
        let entrantBirthDate = Calendar.current.dateComponents([.day, .year, .month], from: hasBirthday)
        
        // checking if month and day are same
        if (todayNumberOfDay == entrantBirthDate.day && todayNumberOfMonth == entrantBirthDate.month) {
            return true
        }
        return false
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
