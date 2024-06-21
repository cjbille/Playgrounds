// for-in, while, repeat-while
let scores = [75, 43, 104, 85, 85, 95]
var teamScore = 0
for score in scores {
    if score >= 90 {
        print("great job on getting \(score)")
    } else {
        print("need more practice, score was \(score)")
    }	
}

for (index, score) in scores.enumerated() {
    print("index is \(index), score is \(score)")
}

// if-let
var optionalName: String? = nil
var greeting: String
if let name = optionalName {
    greeting = "hello \(name)"
} else {
    greeting = "no name"
}
print(greeting)

// can also use nullish coalescing operator
let nickName: String? = nil
let fullName: String = "coby jones"
let informalGreeting = "\(nickName ?? fullName)"
print(informalGreeting)

let vegetable = "red bell pepper"
switch vegetable {
case "celery":
    print("green celery")
case "cucumber, lentils":
    print("cucumbers, lentils so good")
case let veggie where veggie.hasSuffix("pepper"):
    print("its a savory red bell pepper")
default:
    print("no vegetable found!")
}

let randomCars = ["hyundai": "sonata", "honda": "accord", "nissan": "altima", "subaru": "legacy"]
for (make, model) in randomCars {
    print("the make is \(make) and the model is \(model)")
}

var total = 0
for i in 0..<4 { //omits 4, use 0...4 to include 4
    total += i
}
print(total)

var n = 2
while n < 0 {
    n *= 2
}
print(n)
// Prints "128"


var m = 2
repeat {
    m *= 2
} while m < 0
print(m)
// Prints "128"

func greet(_ person: String, on day: String) -> String {
    return "hello \(person), today is \(day)"
}

greet("Bill", on: "Monday")

func returnMulitpleValues() -> (min: Int, max: Int, total: String) {
    var min = 8
    var max = 90
    var total = "ninety eight"
    return (min, max, total)
}

print(returnMulitpleValues().max)
print(returnMulitpleValues().total)

func hasMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func isNumberLessThanOneHundred(number: Int) -> Bool {
    return number < 100
}

let numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 120, 140, 160]

hasMatches(list: numbers) { (number: Int) -> Bool in // trailing closure syntax
    return number < 100
}

hasMatches(list: numbers, condition: { (num: Int) -> Bool in // non trailing closure syntax
    return num > 100
})

class Shape {
    var numberOfSides = 0
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func simpleDesc() -> String {
        return "a shape with \(numberOfSides) sides"
    }
}

class EquailateralTriangle: Shape {
    var sidelength: Double
    var perimeter: Double {
        get {
            3.0 * sidelength
        }
        set {
            sidelength = newValue / 3.0
        }
    }
    
    
    init(_ sideLength: Double, _ name: String) {
        self.sidelength = sideLength
        super.init(name)
        numberOfSides = 3
    }
    
    func area() -> Double {
        return sidelength * sidelength
    }
    
    override func simpleDesc() -> String {
        return "a sqaure with sides of length \(sidelength)"
    }
}

var someShape = Shape("square")
someShape.numberOfSides = 4

var triangle = EquailateralTriangle(3.0, "a triangle")
print(triangle.perimeter)
print(triangle.area())
print(triangle.sidelength)
//triangle.perimeter = 9.3
print(triangle.perimeter)
print(triangle.sidelength)

enum Suit {
    case spades, hearts, clubs, diamonds
}

var myCardSuit = Suit.hearts

func returnCardSuit(suit: Suit) -> Suit {
    var mySuit = suit
    return mySuit
}

var randomSuit = returnCardSuit(suit: .diamonds)
print(randomSuit)

print("this is a string without a line break", terminator: "")
print("another string")

let optionalNumber = Int("hello")
var someNum: Int
if let actualNumber = optionalNumber {
    print("We have a number! \(actualNumber)")
    someNum = actualNumber
} else {
    print("We don't have a number")
}

enum FillWaterError: Error {
    case filterExpired
    case tankEmpty
    case tankNeedsCleaning
}

func fillWaterBottle() throws -> String {
    let tankStatus = "yellow"
    let tankEmpty = "yes"
    guard tankStatus == "green" else {
        throw FillWaterError.filterExpired
    }
    guard tankEmpty == "no" else {
        throw FillWaterError.tankEmpty
    }
    return "Success!"
}

do {
    var status = try fillWaterBottle()
    print("Water bottle fill status: \(status)")
} catch FillWaterError.filterExpired {
    print("Water bottle fill error. Water tank filter expired")
} catch FillWaterError.tankEmpty {
    print("Water bottle fill error. Water tank empty")
} catch {
    print("Unknown error \(error)")
}

for character in "dog" {
    print("\(character)")
}

var freddy = "freddy"
freddy.append("fazbear")
print("\(freddy)")

let cars = ["model 3", "model s", "model y"]
let additionalCars = ["model x", "cybertruck"]
let allCars = cars + additionalCars

for (index, ev) in allCars.enumerated() {
    print("ev model is \(ev) at index \(index)")
}

// sets
var letters = Set<Character>()
letters = ["a", "c", "e"]
var musicGeneres: Set = ["rock", "punk", "rap", "jazz"]
print("\(musicGeneres.count)")
print(musicGeneres.isEmpty)

var airports = ["BWI": "Baltimore Washington Internationl", "ATL": "Atlanta"]
airports["LHR"] = "London"
airports.removeValue(forKey: "BWI")

for (_, airport) in airports {
    print(airport)
}

var tempOutside = 75

let weatherMsg = if tempOutside > 80 { // if expression
    "its hot!"
} else if tempOutside <= 80 && tempOutside >= 50 {
    "its tolerable outside"
} else {
    "its pretty cold"
}

print(weatherMsg)

let evChargerLevel = "L3"

switch evChargerLevel {
case "L1":
    print("slow EV charging")
case "L2":
    print("medium EV charging")
case "L3", "DCFC":
    print("fast EV charging")
default:
    print("EV charger level not defined")
}

let evMsg = switch evChargerLevel { // switch expression
case "L1":
    "message: slow EV charging"
case "L2":
    "message: medium EV charging"
case "L3", "DCFC":
    "message: fast EV charging"
default:
    "message: EV charger level not defined"
}

print(evMsg)



func carMinMaxSpeed(_ speed1: Int = 0, _ speed2: Int = 10) -> (min: Int, max: Int) {
    if speed1 < speed2 {
        return (speed1, speed2)
    } else if speed1 > speed2 {
        return (speed2, speed1)
    } else {
        return (speed1, speed2)
    }
}

let (minSpeed, maxspeed) = carMinMaxSpeed(90, 100)

print("the min speed is \(minSpeed) and the max speed is \(maxspeed)")

func variadicFunction(_ lotsOfNumbers: Int...) {
    print(lotsOfNumbers)
}

struct Car {
    var doors: Int
    var color: String
    var wheelSize: Int
}

class Vehicle {
    var doors: Int
    var color: String
    var wheelSize: Int
    
    init() {
        self.doors = 0
        self.color = ""
        self.wheelSize = 0
    }
}

let car = Car(doors: 4, color: "blue", wheelSize: 19)
print(car.doors)
var car2 = car
car2.doors = 2
print(car.doors)
print(car2.doors)


let vehicle = Vehicle()
vehicle.doors = 2
vehicle.color = "red"
vehicle.wheelSize = 18
print(vehicle.doors)
let vehicle2 = vehicle
vehicle2.color = "stealth grey"
print(vehicle.color)
print(vehicle2.color)

var areVehicalsIdentical = vehicle === vehicle2
print(areVehicalsIdentical)


struct Scooter {
    var remaingBatteryPercentage = 100
    var range = "20 miles"
    var speed = 15
}

var scooter = Scooter()
scooter.remaingBatteryPercentage = 90
scooter.range = "18 miles"
