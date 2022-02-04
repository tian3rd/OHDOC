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
