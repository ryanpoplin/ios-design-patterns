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

class Biologist {
	private var name: String!
	private var type: String!
	private var assignments: [String: String]!
	init(name: String, type: String, assignments: [String: String]) {
		self.name = name
		self.type = type
		self.assignments = assignments
	}
	func listOutAssignments() -> [String: String] {
		return assignments
	}
	func listOutResults(results: [String: String]) -> [String: String] {
		return results
	}
}

class Region {
	private var climateType: String!
	init(climateType: String) {
		self.climateType = climateType
	}
	func listClimateType() -> String {
		return climateType
	}
}

class Frog {
	private var type: String!
	private var region: Region!
	init(type: String, region: Region) {
		self.type = type
		self.region = region
	}
	func listType() -> String {
		return type
	}
	func listRegion() -> Region {
		return region
	}
}

// Future Recs: add 'Climate' class and 'Food' class...
// The API would get it's data from a UI in classical MVC...
class BiologistFrogAnalysisAPI {
	private var frogs: [String: Frog]!
	private var regions: [String: Region]!
	private var biologist: Biologist!
	init() {
		// if coming from web service, can be placed into a Store || ClientStore class
		regions = [
			"Mediterranean": Region(climateType: "Mediterranean"),
			"Arid": Region(climateType: "Arid"),
			"Tropical Wet": Region(climateType: "Tropical Wet"),
			"Highland": Region(climateType: "Highland")
		]
		frogs = [
			"Yellow": Frog(type: "Yellow", region: regions["Mediterranean"]!),
			"Brown": Frog(type: "Brown", region: regions["Arid"]!),
			"Red": Frog(type: "Red", region: regions["Tropical Wet"]!),
			"Blue": Frog(type: "Blue", region: regions["Highland"]!)
		]
		biologist = Biologist(name: "Ryan Poplin", type: "Amphibian", assignments: ["1": "When a frog switches regions, what happens to their reproduction and diet status?"])
	}
	func listRegions() -> [String: Region] {
		return regions
	}
	func listFrogs() -> [String: Frog] {
		return frogs
	}
	func moveFrogToDifferentRegion(frog: Frog, region: Region) -> String {
		return "\(frog.type) frog of region \(frog.region.climateType) moved to \(region.climateType) region."
	}
	class var sharedInstance: BiologistFrogAnalysisAPI {
		struct Singleton {
			static let instance = BiologistFrogAnalysisAPI()
		}
		return Singleton.instance
	}
}

let regions = BiologistFrogAnalysisAPI.sharedInstance.listRegions()
let frogs = BiologistFrogAnalysisAPI.sharedInstance.listFrogs()
let movedFrog = BiologistFrogAnalysisAPI.sharedInstance.moveFrogToDifferentRegion(frogs["Yellow"]!, region: regions["Tropical Wet"]!)