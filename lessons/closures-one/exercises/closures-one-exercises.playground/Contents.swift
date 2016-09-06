//: Playground - noun: a place where people can play

import UIKit

// Closures-One-Exercises

//1. Create a closure that has no parameters or values and prints "Hello Closures!". Check by passing closure's return to a variable
let helloClosure = {
  print("Hello Closures!")
}
helloClosure()

//2. Create a closure that takes one Int and returns the doubled value. Check by passing closure's return to a variable.
let double = {(a: Int) -> Int in
  return a * 2
}
double(14)

//3. Create a closure that takes one Int and returns a bool whether or not it's divisible by 3.
let divisibleBy3 = {(a: Int) -> Bool in
  return a % 3 == 0
}
divisibleBy3(99)

//4. Create a closure that takes two strings as input and returns the longest character count of the two strings.
let longestString = {(a: String, b: String) -> Int in
  let x = a.characters.count
  let y = b.characters.count
  if x > y {
    return x
  } else {
    return y
  }
}
longestString("THIS","THATHATHATHAHT")

//5a. Create a closure that takes an array of Int as input and returns the largest element in the array
let largestInt = {(a: [Int]) -> Int in
  let sorted = a.sort(>)
  return sorted[0]
}
largestInt([234,234,324,553,645,76,4,46,47,3573,5727,355])

//5b.  Create a closure that takes an array of Int and variable x: Int as input and returns the xth largest element in the array.  Assume x is always < the count of the array
let nthLargest = {(a: [Int], x: Int) -> Int in
  let sorted = a.sort(>)
  return sorted[x - 1]
}
nthLargest([234,23,24,34,457,46,856,8,45,5865,54,45435], 3)

//5c.  Rewrite 5b and add handling for cases where x >= the count of the array (Hint: Use optionals)
let xthLargest = {(a: [Int], x: Int) -> String in
  let sorted = a.sort(>)
  if x >= sorted.count {
    return "Place is too high"
  }
  return String(sorted[x - 1])
}
xthLargest([1,13,431,12], 1)

//----------------------OR-----------------//

let xthLargest2 = {(a: [Int], x: Int) -> Int? in
  if x < a.count {
    return a.sort({$0 > $1})[x]
  } else {
    return nil
  }
}

//Higher order functions

let myArray = [34,42,42,1,3,4,3,2,49]

//6a. Sort myArray in ascending order by defining the constant ascendingOrder below.

let ascendingOrder = {(a: Int, b: Int) -> Bool in
  return a < b
}
let mySortedArray = myArray.sort(ascendingOrder)


//6b. Sort myArray in descending order by defining the constant descendingOrder below.

let descendingOrder = {(a: Int, b: Int) -> Bool in
  return a > b
}
let mySecondSortedArray = myArray.sort(descendingOrder)


let arrayOfArrays = [[3,65,2,4,3,4,4],[25,3,1,6],[245,2,3,5,74]]

//7a. Sort arrayOfArrays in ascending order by the 3rd element in each array.  Assume each array will have at least 3 elements

let xthAsc = {(input: [[Int]], x: Int) -> [[Int]] in
  return input.sort({(a: [Int], b: [Int]) -> Bool in
    return a[x - 1] < b[x - 1]
  })
}
xthAsc(arrayOfArrays, 3)

//7b. Sort arrayOfArrays in ascending order by the 3rd element in each array.  Don't assume each array will have at least 3 elements.  Put all arrays that have less than 3 elements at the end in any order.


let xthAsc2 = {(input: [[Int]], x: Int) -> [[Int]] in
  var validA = [[Int]]()
  var invalidA = [[Int]]()
  
  for i in input {
    if x <= i.count {
      validA.append(i)
    } else {
      invalidA.append(i)
    }
  }
  return validA.sort({$0[x - 1] < $1[x - 1]}) + invalidA
}
print(xthAsc2(arrayOfArrays, 5))


let letterValues = [
    "a" : 54,
    "b" : 24,
    "c" : 42,
    "d" : 31,
    "e" : 35,
    "f" : 14,
    "g" : 15,
    "h" : 311,
    "i" : 312,
    "j" : 32,
    "k" : 93,
    "l" : 203,
    "m" : 212,
    "n" : 41,
    "o" : 102,
    "p" : 999,
    "q" : 1044,
    "r" : 404,
    "s" : 649,
    "t" : 414,
    "u" : 121,
    "v" : 838,
    "w" : 555,
    "x" : 1001,
    "y" : 123,
    "z" : 432
]

//8a. Sort the string below in descending order according the dictionary letterValues

var codeString = "aldfjaekwjnfaekjnf"

print(codeString.characters.sort{(a, b) -> Bool in
  var valA = letterValues[String(a)]
  var valB = letterValues[String(b)]
  return valA > valB
})

//8b.  Sort the string below in ascending order according the dictionary letterValues

var codeStringTwo = "znwemnrfewpiqn"

print(codeStringTwo.characters.sort{(a, b) -> Bool in
  var valA = letterValues[String(a)]
  var valB = letterValues[String(b)]
  return valA < valB
})


//9.  Write a function that takes a function as input and returns a function that doubles the output of the input function

//Input: (Int) -> Int
//Output: (Int) -> Int

func inputFunc(x: Int) -> Int {
  return x + 1
}

func inputDouble (a: (Int)) -> (Int) -> Int {
  return {(_) -> (Int) in
    a * 2
  }
}
inputDouble(inputFunc(7))(3)

//-----------------------OR------------------------//

func doStuff(withNumber x: Int) -> () -> Int {
  var a = 4
  func doOtherStuff() -> Int {
    a += x
    return a
  }
  return doOtherStuff
}
let doStuffWithSix: () -> Int = doStuff(withNumber: 6)
doStuffWithSix()
print(doStuffWithSix())

//-----------------------OR------------------------//

func stuffFunc(withNumber x: Int) -> (c: Int) -> Int {
  var a = 4
  func otherStuffFunc(c: Int) -> Int {
    a += x
    return a + c
  }
  return otherStuffFunc
}
let stuffFuncWithSix: (Int) -> Int = stuffFunc(withNumber: 6)
stuffFuncWithSix(20)                 // adds the arguement after 4 + 6
print(stuffFuncWithSix(3))          // adds the arguement after 4 + 6

//10.  Write a closure tripleNumber that takes no arguments and returns void.  It should multiply the global variable number by 3 each time the closure is run.

var number = 1

var tripleNumber = {
  return number *= 3
}
tripleNumber()
number



//9. Given a tuple representation of our names from before:

let firstAndLastTuples = [("Johann S.", "Bach"),
                                 ("Claudio", "Monteverdi"),
                                 ("Duke", "Ellington"),
                                 ("W. A.", "Mozart"),
                                 ("Nicolai","Rimsky-Korsakov"),
                                 ("Scott","Joplin"),
                                 ("Josquin","Des Prez")]

// sort the array of tuples by last name. Print the sorted array using string interpolation so that
// the output looks like:
// Bach, Johann S.
// Des Prez, Josquin
// .
// .
// .
let names = firstAndLastTuples.sort{( $0.1 < $1.1)}
for i in names {
  print("\(i.0) \(i.1)")
}

//10. Build an array of tuples representing everyone in the class. Here you are sorted by first name:
//

//Amber Spadafora	3201
//Ana Ma	3202
//Annie Tung	3203
//Cristopher Chavez	3204
//Eashir Arafat	3205
//Edward Anchundia	3206
//Emily Chu	3207
//Eric Chang	3208
//Erica Stevens	3209
//Fernando Ventura	3210
//Harichandan Singh	3211
//Ilmira Estil	3212
//Jermaine Kelly	3213
//Gabriel Breshears	3214
//Kadell Gregory	3215
//Kareem James	3216
//Karen  Manzanares Fuentes 	3217
//Leandro Nunez	3218
//Liam Kane	3219
//Luz Loayza Herrera	3220
//Madushani Lekam Wasam Liyanage	3221
//Marcel Chaucer	3222
//Margaret Ikeda	3223
//Maria Scutaru	3224
//Marty Avedon	3225
//Michael Pinnock	3226
//Miti  Shah	3227
//Rukiye Karadeniz	3228
//Sabrina Ip	3229
//Simone Grant	3230
//Sophia Barrett	3231
//Thinley  Dorjee	3232
//Tom Seymour	3233
//Tong Lin	3234
//Tyler Newton	3235
//Victor Zhong	3236




// Build a sort comparison closure that will bring your name as close to the top as possible.
// We will use this to determine the order we use to access the microwave.
// Feel free to add fields to the tuple to accomplish this -- yes, this is a cheat.
let ac32folks = [("Amber", "Spadafora",	3201),
                 ("Ana", "Ma",	3202),
                 ("Annie", "Tung",	3203),
                 ("Cristopher", "Chavez", 3204),
                 ("Eashir", "Arafat", 3205),
                 ("Edward", "Anchundia", 3206),
                 ("Emily", "Chu", 3207),
                 ("Eric", "Chang", 3208),
                 ("Erica", "Stevens", 3209),
                 ("Fernando", "Ventura", 3210),
                 ("Harichandan", "Singh", 3211),
                 ("Ilmira", "Estil", 3212),
                 ("Jermaine", "Kelly", 3213),
                 ("Gabriel", "Breshears", 3214),
                 ("Kadell", "Gregory", 3215),
                 ("Kareem", "James", 3216),
                 ("Karen", "Fuentes", 3217),
                 ("Leandro", "Nunez", 3218),
                 ("Liam", "Kane", 3219),
                 ("Luz", "Herrera", 3220),
                 ("Madushani", "Liyanage", 3221),
                 ("Marcel", "Chaucer", 3222),
                 ("Margaret", "Ikeda", 3223),
                 ("Maria", "Scutaru", 3224),
                 ("Marty", "Avedon", 3225),
                 ("Michael", "Pinnock", 3226),
                 ("Miti", "Shah", 3227),
                 ("Rukiye", "Karadeniz", 3228),
                 ("Sabrina", "Ip", 3229),
                 ("Simone", "Grant", 3230),
                 ("Sophia", "Barrett", 3231),
                 ("Thinley", "Dorjee", 3232),
                 ("Tom", "Seymour", 3233),
                 ("Tong", "Lin", 3234),
                 ("Tyler", "Newton", 3235),
                 ("Victor", "Zhong", 3236)]

var microwaveLine = ac32folks.sort{(a, b) -> Bool in
  var x = a.2
  var y = b.2
  if x == 3208 {
    x += 1000
    return x > y
  }
  return x > y
}
for i in microwaveLine {
  if i.0 == "Eric" {
    print("\(i.0) is awesome!!")
  } else {
    print("\(i.0) is awesome but less awesome than Eric!!")
  }
}


//11. Create a closure that takes an two arrays of strings as input. Output a new string with the contents of the arrays in alternating order and separated by a space. If one array's length is longer than the other, append the rest of it's contents to the new string.

// eg: input array1: ["Hello", "My", "Friend"] array2: ["Darkness", "Old"]
//      output string: "Hello Darkness My Old Friend
