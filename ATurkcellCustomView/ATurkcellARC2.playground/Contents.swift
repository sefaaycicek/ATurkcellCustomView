import UIKit


class Person {
    let name : String
    weak var pet : Pet?
    
    init(name: String) {
        self.name = name
        print("\(name) init edildi")
    }
    
    deinit {
        print("\(name) deinit edildi")
    }
}

class Pet {
    let name : String
    weak var owner : Person?
    
    init(name: String) {
        self.name = name
        
        
    }
    
    deinit {
        print("\(name) deinit edildi")
    }
}

var person : Person? = Person(name: "Ali")
var pet : Pet? = Pet(name: "Kedicik")

person?.pet = pet
pet?.owner = person

person = nil
pet?.owner?.name
