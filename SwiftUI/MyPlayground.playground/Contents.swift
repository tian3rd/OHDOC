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
