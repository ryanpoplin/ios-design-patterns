import Swift
import Foundation

// Encapsulation means that objects keep their state information private. Rather than directly manipulating an object’s data, other objects send requests to the object, in the form of messages, some of which the object may respond to by altering its internal state.

// Polymorphism means that objects of different classes can be used interchangeably. This is especially important, as it allows you to hook up classes at a later date in ways you didn’t necessarily foresee when those classes were first designed.

// Inheritance means that objects of one class can derive part of their behavior from another (base or parent) class. Some object-oriented languages (C++, for example, but not Swift) allow multiple inheritance, where objects of one class can derive part or all of their behavior from multiple independent base classes.

class Button {}
let button = Button()

class Square {
	
	var length = 1
	
	init(length: Int) {
		self.length = length
	}
	
	func area() -> Int {
		return length * length
	}
	
}

var firstSquare = Square(length: 3)
print(firstSquare.length)

var secondSquare = Square(length: 10)
print(secondSquare.length)

if firstSquare.length < secondSquare.length {
	print("The small square has a length of \(firstSquare.length)")
} else {
	print("The small square has a length of \(secondSquare.length)")
}

var square = Square(length: 5)
square.area()

class Tank {
	
	class var bonusDamage: Double {
		return Double(Upgrade.level) * 2.5
	}
	
	let baseDamage = 10.0
	
	var damage: Double {
		return self.baseDamage + Tank.bonusDamage
	}
	
	class func upgrade() {
		Upgrade.level += 1
	}
	
	struct Upgrade {
		static var level = 0
	}
	
}

var tank = Tank()
print(tank.damage)
Tank.upgrade()
print(tank.damage)

// Subclassing NSObject in Swift gets you Objective-C runtime flexibility but also Objective-C performance. Avoiding NSObject can improve performance if you don’t need Objective-C’s flexibility.

class AClass {
	func doSomething() -> String {
		return "Hello from AClass"
	}
}

class SubClass: AClass {
	override func doSomething() -> String {
		super.doSomething()
		return "Override Superclass!"
	}
}

let baseObject = AClass()
baseObject.doSomething()

let enhancedObject = SubClass()
enhancedObject.doSomething()

class User {
	var name: String!
	var age: Int!
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}

protocol SwiftProtocol { }

class AnotherSwiftClass: SwiftProtocol {  }

protocol Targetable {
	var life: Int { get set }
	func takeDamage(damage: Int)
}

protocol Shootable {
	func shoot(target: Targetable)
}

class Pistol: Shootable {
	func shoot(target: Targetable) {
		target.takeDamage(1)
	}
}

class Shotgun: Shootable {
	func shoot(target: Targetable) {
		target.takeDamage(5)
	}
}

class Enemy: Targetable {
	var life: Int = 10
	func takeDamage(damage: Int) {
		life -= damage
		print("enemy lost \(damage) hit points")
		if life <= 0 {
			print("enemy is dead now")
		}
	}
}

class Player {
	var weapon: Shootable!
	init(weapon: Shootable) {
		self.weapon = weapon
	}
	func shoot(target: Targetable) {
		weapon.shoot(target)
	}
}

var terminator = Player(weapon: Pistol())
var enemy = Enemy()
terminator.shoot(enemy)
terminator.weapon = Shotgun()
terminator.shoot(enemy)

class GraphicObject {
	func draw() {
		print("does nothing")
	}
}

class SpaceShip: GraphicObject {
//	override func draw() {
//		print("draws a Space Ship")
//	}
}

class EmpireSpaceShip: SpaceShip {
	override func draw() {
		print("draws an Empire Space Ship")
	}
}

class RebellionSpaceShip: SpaceShip {
	override func draw() {
		print("draws a Rebellion Space Ship")
	}
}

class DeathStar: GraphicObject {
	override func draw() {
		print("draws a Death Star")
	}
}

let spaceShips = [EmpireSpaceShip(), RebellionSpaceShip(), DeathStar()]
for spaceShip in spaceShips {
	spaceShip.draw()
}

class Singleton {
	
	func saySomething() -> String {
		return "Single Instance"
	}
	
	struct Static {
		static let instance = Singleton()
	}
	class var sharedInstance: Singleton {
		return Static.instance
	}
}

Singleton.sharedInstance.saySomething()

