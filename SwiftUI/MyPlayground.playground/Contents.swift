import Cocoa

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

