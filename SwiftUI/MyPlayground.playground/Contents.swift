import Cocoa
import Foundation

var greeting = "Hello, playground"

let filename = "dog.jpg"
print(filename.hasSuffix(".jpg"))

let number = 50
print(number.isMultiple(of: 5))

let isGameOver = false
print(isGameOver)
print("Is game over?\n\(isGameOver)")

var temperature = Double(20)
var temperatureFahrenheit = temperature * 1.8 + 32
print("Celsius: \(temperature)°C\nFahrenheit: \(temperatureFahrenheit)°F")

// initialize a new array
var numArr = Array<Int>()
numArr.append(0)
numArr.append(1)
print(numArr.count)

// initialize a new dictionary
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Kobe"] = 198
print(heights)

let olympics = [2008: "Beijing", 2012: "London"]
print(olympics[2008, default: "BJ"])
print(olympics.keys.count)
print(olympics.values)

// initialize a new set
var actors = Set<String>()
actors.insert("Tom Hanks")
actors.insert("Jude Law")
actors.insert("Danziel Washington")
print(actors.sorted())

// initialize an enum type
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
print(day)

// type annotation
var score: Int = 100
// type conversion
var price: Double = 10
print(price)
// array, dict & set
var albums: [String] = []
albums.append("X&Y")
albums.append("Lenka")

var users: [String: Int] = ["Jack": 0, "Rose": 1]

var movies: Set<String> = Set(["American History X", "Batman Begins"])

// type inference
var teams: [String] = [String]()
var members: [String] = []
var numbers = [Int]()

// create a constant without initialization first
let username: String
// other stuff going on
username = "Bill"

// checkpoint 2
// create an array with duplicates
var players = ["Yao", "O'Neil", "Bryant", "Lin", "Yao"]
print(players.count)
print(Set(players).count)

// if statement
var mealsToday = ["milk", "bread", "barbecue"]
if mealsToday.isEmpty {
    print("You didn't eat anything!")
} else {
    print("Your first meal is \(mealsToday[0])")
}

// use && or || for a more complete example
enum Weather {
    case sunny, cloudy, rainy, snowy
}

// use switch and case and default and fallthrough
let todayWeather = Weather.cloudy

switch todayWeather {
case .sunny:
    print("It's a lovely day")
case .rainy:
    print("Awww...")
case .cloudy:
    print("Hopefully it's getting better")
    fallthrough
case .snowy: print("Yay!")
}

// use ternery operator: WTF what true false
var hour = 22
print(hour <= 12 ? "It's early" : "It's late")

// for loop
let platforms = ["Linux", "Windows", "Mac OS"]

for platform in platforms {
    print("Let's take a look at \(platform)")
}

for i in 1...10 {
    print("-------")
    for j in 1..<11 {
        print("\(i) * \(j) is \(i * j)")
    }
}

// while loop
var countdown = 10

while countdown > 0 {
    print("Counting: \(countdown)")
    countdown -= 1
}

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("Rolled a \(roll)")
}
print("Hit!")

// break & continue inside loops

// check point 3: fizzbuzz
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
        continue
    }
    if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print("\(i)")
    }
}

// function intro
func fizzbuzz(till: Int) {
    for i in 1...till {
        if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
            print("FizzBuzz")
            continue
        }
        if i.isMultiple(of: 3) {
            print("Fizz")
        } else if i.isMultiple(of: 5) {
            print("Buzz")
        } else {
            print("\(i)")
        }
    }
}

fizzbuzz(till: 16)

// function return value
func checkSameLetters(firstStr: String, secondStr: String) -> Bool {
    return firstStr.sorted() == secondStr.sorted()
}

print(checkSameLetters(firstStr: "abc", secondStr: "cba"))

// code example of sorted()
let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
let sortedStudents = students.sorted()
print(sortedStudents)

// use tuple as a return
func getName() -> (firstName: String, lastName: String) {
    ("Phillip", "W")
}

let (fName, lName) = getName()
print("Name: \(fName) \(lName)")

// ignore internal parameter name using _
func checkEven(_ number: Int) -> Bool {
    number.isMultiple(of: 2)
}

print(checkEven(2))
print(checkEven(3))

// use both external & internal param names
func printLoop(till number: Int) {
    for i in 1...number {
        print(i)
    }
}

printLoop(till: 10)

// default parameter
func bestBasketballPlayer(_ name: String = "Kobe") {
    print("The best basketball player is \(name)")
}

bestBasketballPlayer()
bestBasketballPlayer("Jordan")

// try catch errors
enum PasswordError: Error {
    case short, obvious
}

func checkPasswordIntensity (_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    } else if password.hasPrefix("12345") {
        throw PasswordError.obvious
    } else {
        return "Good!"
    }
}

do {
    let myPassQuality = try checkPasswordIntensity("234")
    print("Quality: \(myPassQuality)")
} catch PasswordError.short{
    print("Too short!")
} catch {
    print("Not good!")
}

// check point 4
enum IntSqrtError: Error {
    case outOfBounds, noRoot
}
func findIntSqrt(_ number: Int) throws -> Int{
    var sqrt: Int = 0
    if number < 1 || number > 10_000 {
        throw IntSqrtError.outOfBounds
    } else {
        for i in 1...number {
            if i * i == number {
                sqrt = i
                break
            } else if i * i > number {
                throw IntSqrtError.noRoot
            }
        }
    }
    return sqrt
}

do {
    let sqrt = try findIntSqrt(9)
    print(sqrt)
} catch {
    print("ERRoR!")
}

// closure
let basketballPlayers = ["Yao Ming", "Kobe", "Jordan", "Shaq", "Carter"]
print(basketballPlayers.sorted())
print(basketballPlayers.sorted(by: {(player1: String, player2: String) -> Bool in
    if (player1 == "Kobe") {
        return true
    } else if (player2 == "Kobe") {
        return false
    } else {
        return player1 < player2
    }
}))

// trailing closure & shorthand syntax
let lakers = basketballPlayers.filter {
    $0.count == 4
}
print(lakers)

// check point 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let luckierNumbers = luckyNumbers.filter {
    !$0.isMultiple(of: 2)
}.sorted().map { (number: Int) -> String in
    let luckyString = "\(number) is a lucky number"
    print(luckyString)
    return luckyString
}
print(luckierNumbers)

// struct

//You can create your own structs by writing struct, giving it a name, then placing the struct’s code inside braces.
//Structs can have variable and constants (known as properties) and functions (known as methods)
//If a method tries to modify properties of its struct, you must mark it as mutating.
//You can store properties in memory, or create computed properties that calculate a value every time they are accessed.
//We can attach didSet and willSet property observers to properties inside a struct, which is helpful when we need to be sure that some code is always executed when the property changes.
//Initializers are a bit like specialized functions, and Swift generates one for all structs using their property names.
//You can create your own custom initializers if you want, but you must always make sure all properties in your struct have a value by the time the initializer finishes, and before you call any other methods.
//We can use access to mark any properties and methods as being available or unavailable externally, as needed.
//It’s possible to attach a property or methods directly to a struct, so you can use them without creating an instance of the struct.

// checkpoint 6
struct Car {
    private var model: String
    private var seats: Int
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
    
    var currentGear: Int = 0 {
        didSet {
            print("Current gear is \(currentGear)")
            print("Old gear is \(oldValue)")
        }
    }
    
    var modelInfo: String {
        get {
            return model
        }
    }
    
    var seatsInfo: Int {
        get {
            return seats
        }
    }
    
    mutating func changeGear(change: Int) {
        currentGear += change
        if currentGear > 10 || currentGear < 0 {
            print("Illegal gear setup, abort...")
            return
        }
        if change > 0 {
            print("Changing gear up")
        } else {
            print("Changing gear down")
        }
    }
}

var myCar = Car(model: "Koleos", seats: 5)
print("My car is \(myCar.modelInfo) and have \(myCar.seatsInfo) seats")
myCar.changeGear(change: 10)
myCar.changeGear(change: 1)

// class
// check point 7
class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    override init(legs: Int = 4) {
        super.init(legs: legs)
    }
    func speak() {
        print("Woof")
    }
}

class Corgi: Dog {
    override func speak() {
        print("I'm a Corgi!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I'm a Poodle")
    }
}

class Cat: Animal {
    let isTame: Bool
    init(legs: Int = 4, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("Meow")
    }
}

class Persian: Cat {
    override func speak() {
        print("I'm a Persian cat")
    }
}

class Lion: Cat {
    override func speak() {
        print("I'm the king!")
    }
}

let zimba = Lion(isTame: false)
zimba.speak()
print(zimba.legs)
let puppy = Poodle()
print(puppy.speak())

// protocols and extentions: https://www.hackingwithswift.com/100/swiftui/13
// check point 8
protocol Building {
    var numRooms: Int {get set}
    var cost: Int {get set}
    var agent: String {get set}
    func summary()
}

extension Building {
    func summary() {
        print("""
              Number of rooms: \(numRooms)
              Cost: \(cost)
              Agent: \(agent)
              """)
    }
}

struct House: Building {
    var numRooms: Int
    var cost: Int
    var agent: String
    func summary() {
        print("This house has \(numRooms) rooms, costing \(cost) dollars, built by \(agent)")
    }
}

struct Office: Building {
    var numRooms: Int
    var cost: Int
    var agent: String
    func summary() {
        print("This office has \(numRooms) rooms, costing \(cost) dollars, which is built by \(agent)")
    }
}

struct SomeBuilding: Building {
    var numRooms: Int
    var cost: Int
    var agent: String
}

let aBuilding = SomeBuilding(numRooms: 2, cost: 10000, agent: "LJ Hooker")
aBuilding.summary()

let bBuilding = House(numRooms: 5, cost: 660000, agent: "Oval")
bBuilding.summary()

// optionals
// checkpoint 9
func selectRandomly(from arr: [Int]?) -> Int {
    return arr?.randomElement() ?? Array(1...100).randomElement()!
}

print(selectRandomly(from: nil))
print(Array(1...100).randomElement())
print(Array(1...100).randomElement()!)
// or use Int.random(in: 1...100)
