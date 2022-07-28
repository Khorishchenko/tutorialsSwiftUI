//
//  main.swift
//  testSwift
//
//  Created by user on 26.05.2022.
//
import Cocoa
import Foundation

//MARK: Змінні
print("Hello, World!")

// TODO: Простые ценности

var myVariable = 42
myVariable = 50
let myConstant = 42

print(myConstant, myVariable)

print(myVariable + myConstant)

//--------------------------------------------------------------------------------------------------//

// TODO: Если начальное значение не предоставляет достаточно информации (или если оно не является начальным значением), укажите тип, записав его после переменной, разделенной двоеточием.

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

print(explicitDouble)

//--------------------------------------------------------------------------------------------------//
// TODO: Значения никогда не подразумеваются в другой тип. Если вам нужно преобразовать значение в другой тип, явно создайте экземпляр нужного типа.

let label = "The width is "
let width = 94
let widthLabel = label + String(width)      // змінюєм тип на з int на string Круто !!!


print(widthLabel)

//--------------------------------------------------------------------------------------------------//

// TODO: Есть еще более простой способ включить значения в строки: запишите значение в скобках и запишите обратную косую черту (\) перед скобками. Например:

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//TODO:  Используйте \(), чтобы включить вычисление с плавающей запятой в строку и включить чье-то имя в приветствие.

print(fruitSummary)

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

print(quotation)




// MARK: Создавайте массивы
//--------------------------------------------------------------------------------------------------//
//TODO: Создавайте массивы и словари с помощью скобок ([] ), и получите доступ к их элементам, записав индекс или ключ в скобках. Запятая разрешена после последнего элемента

print("--------------------------------------")
print("Создавайте массивы\n")

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

print(shoppingList)
print(occupations)

// TODO: Массивы автоматически растут при добавлении элементов.

shoppingList.append("blue paint")
print(shoppingList)
 


// TODO: Чтобы создать пустой массив или словарь, используйте синтаксис инициализатора.

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]



// MARK: Контрольный поток
//--------------------------------------------------------------------------------------------------//
print("--------------------------------------")
print("Контрольный поток\n")

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

// for

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)



var myArrr = ["Hello", "World", "My", "Name", "is", "Sergey"]

var oscar = 100;

myArrr[2] = String(oscar)

// for
print("--------------------------------------")
print("for\n")

for score in myArrr{
    print(score, oscar)
}




// TODO: nil and ?
print("--------------------------------------")
print("nil and ?\n")

var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

print(greeting)


// TODO: ?? оператор  аналог ілі ||


print("--------------------------------------")
print("?? оператор  аналог ілі ||\n")

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)




let vegetable = "red pepper"

switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// TODO: for

print("--------------------------------------")
print("for\n")

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest) // 25 max element


// TODO: or

// TODO: sum arr Prime/Fibonacci/Square
//
largest = 0
for (name, numbers) in interestingNumbers{
    for number in numbers{
        largest += number
    }
    print("Sum \(name), is \(largest)")
    largest = 0
}

// TODO: while

print("--------------------------------------")
print("while\n")

var n = 2
while n < 100 {
    n *= 2
}
print(n)
// Prints "128"

// TODO: do _while
print("--------------------------------------")
print("do _while\n")

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// Prints "128"


// TODO: Ви можете зберегти індекс у циклі, використовуючи ..< для створення діапазону індексів.

var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// Prints "6"


//MARK:  Функции и закрытия
//--------------------------------------------------------------------------------------------------//

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))

// TODO: По умолчанию функции используют свои имена параметров в качестве меток для своих аргументов. Напишите пользовательскую метку аргумента перед именем параметра или напишите _, чтобы не использовать метку аргумента.

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day).\n"
}
print(greet("John", on: "Wednesday"))


// TODO: Сквозні параметри, ссилки & == inout

print("--------------------------------------")
print("Сквозні параметри, ссилки & == inout\n")

func ChangeValue(to number: inout Int) {
    number += 10
}

var input: Int = 10

print("\(input)")

ChangeValue(to: &input)

print("\(input)")


// MARK: Клоужер(closure) - Замыкания /Лямбда/
print("--------------------------------------")
print("Клоужер\n")

/*
 
 { (parametr) -> type return in
    
    body clo
 }
 
 */


let driving = {
    print("In my car")
}

driving()

let driving2 = { (param: String) -> String in
     return ("Hello \(param) Ha ha ha")
}

let messege = driving2("London")

print(messege)


let cloug = {() -> Bool in
    return true
}
 

func animate(duration: Double, animation: () -> Void) {
    print ("Strarting a \(duration) second animation")
    animation()
}

// We can write this

animate(duration: 3, animation: {
    print ("Image")
})


// or this

animate(duration: 3) {
    print ("Image")
}



func travel(action: (String) -> Void) {
    print("Im getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I am going to \(place) in my car")
}

print("--------------------------------------------\n")


let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

func Speed(action: (Int) -> Void) {
    print("My speed is")
    action(100)
}

Speed(action: changeSpeed)



func travel2(action: (String) -> String) {
    let present = action("Marcus")
    print(present)
}

travel2 { (place: String) -> String in
    return "Hello \(place), How are you ?"
}

print("--------------------------------------------\n")

func travel3(action: (String) -> String) {
    let present_N = action("London")
    print(present_N)
}

travel3 { place in
    "Go to \(place)"
}


print("--------------------------------------------\n")

func travel5(action: (String, Int) -> String) {
    let arr = action("London", 3500)
    print(arr)
}

travel5 {
    "I am go to \($0), in with here \($1) kph"
}


print("--------------------------------------------\n")


func travel6() -> (String) -> Void {
    var counter = 1
    return {
        print ("\(counter) I am going to \($0)")
        counter += 1
    }
}


let result = travel6()

result("London")
result("London")
result("London")

print("--------------------------------------------\n")



// MARK: Enum
print("--------------------------------------")
print("enum\n")

enum Activity {
    case dancing
    case running
    case talking
    case singing
}

let currentActivity = Activity.dancing


switch (currentActivity) {
    
case .dancing: print("Dance")
case .running: print("Run")
case .talking: print("Talk")
case .singing: print("Sing")
    
}

print("--------------------------------------")

enum Activity2 {
    case dancing
    case running(dectination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity2.talking(topic: "Foot")

switch (currentActivity) {
    
case .dancing: print("Dance")
case .running: print("Run")
case .talking: print("Talk")
case .singing: print("Sing")
    
}

print("--------------------------------------")

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}


let earth = Planet(rawValue: 3)
print(earth!.rawValue)
print(earth!)
print(earth)


print("--------------------------------------")

enum Phone: String {
    case Apple = "iPhone 8"
    case Samsung = "Galaxy S10"
    case Google = "Pixel 2"
}

var myPhone = Phone.Apple

print(myPhone)
print(myPhone.rawValue)
print("--------------------------------------")

// MARK: Class
print("Class\n")


class Human {
    
    var age: Int
    var name: String
    
    // TODO: Вычисляемые свойства
    var status: String {
        if isQualified {
            return "\(name) is qualifeds for this job "
        }
        else {
            return "\(name) is not  qualifeds for this job "
        }
    }
    
    var isQualified: Bool
    
    init(age: Int, name: String, isQualified: Bool) {
        self.age = age
        self.name = name
        self.isQualified = isQualified
    }
}


var igor = Human(age: 23, name: "Igor", isQualified: false)

print(igor.status)

//var name value: type values {
//    get {
//
//    }
//    set {
//
//    }
//}

print("--------------------------------------")

class Account {
    
    var sum: Double = 0
    var rate: Double = 0.01
    
    var profit: Double {
        get {
            return sum + sum * rate
        }
        set(newProfit) {
            self.sum = newProfit / (1 + rate)
        }
    }
    
    init (sum: Double, rate: Double) {
        self.sum = sum
        self.rate = rate
    }
}

var myAcc: Account = Account(sum: 1000, rate: 0.1)

print(myAcc.profit)

myAcc.profit = 2000

print(myAcc.sum)


print("--------------------------------------")


class Acc {
    
    var sum: Double {
        willSet (newSum) {
            print("Previus sum: \(self.sum) / New sum: \(newSum)")
        }
        
        didSet(oldSum) {
            print("Sum increased by: \(self.sum - oldSum)")
        }
    }
    
    var rate: Double = 0.01
    
    init(sum: Double) {
        self.sum = sum
    }
}

var newValue = Acc(sum: 100)

print("--------------------------------------")
// TODO: How to work didSet!
print("How to work didSet!")

class Dog {
    
    var name: String
    var age: Int {
        didSet {
            if age > maxAge {
                age = oldValue
            }
        }
    }
    
    var maxAge = 30
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var dog = Dog(name: "Sobaka", age: 5)

print(dog.age)

dog.age = 31

print(dog.age)
print("--------------------------------------")


// MARK: Struct
print("Struct\n")


// TODO: mutating
struct Person {
    var name: String
    
    mutating func makeAnon() { // TODO: mutating - For the function to work
        name = "nonName"
    }
}


var Oleg = Person(name: "Oleg")

print(Oleg.name)

Oleg.makeAnon()

print(Oleg.name)
print("--------------------------------------")




