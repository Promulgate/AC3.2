/**
#1

- If want to compare a heavy amount of things, you can have an IF nested in each CASE rather than IF nested in IF four or five times
- We can use tuples, ranges, queries in both switch and ifs
*/

/**
#2

c. The below code will not compile because switch statements need case statements for all expected values or a default statement.
*/

/**
#3

temperatureInFahrenheit = 72

if temperatureInFahrenheit <= 40 {
print("It's cold out.")
} else if temperatureInFahrenheit >= 85 {
print("It's really warm.")
} else {
print("Weather is moderate.")
}

Convert to Switch

var temperatureInFahrenheit = 72
switch temperatureInFahrenheit {
case 0...40:
print("It's cold out.")
case 85...120:
print("It's really warm.")
default:
print("Weather is moderate.")
}
*/

/**
#4

let cardNum = 12
if cardNum == 11 {
print("Jack")
} else if cardNum == 12 {
print("Queen")
} else if cardNum == 13 {
print("King")
} else {
print(cardNum)
}

Convert to Switch
switch cardNum {
case 11:
print("Jack")
case 12:
print("Queen")
case 13:
print("King")
default:
print(\(cardNum))
}
*/

/**
#5

100 -> A+
90 - 99 -> A
80 - 89 -> B
70 - 79 -> C
65 - 69 -> D
Below 65 -> F

var grade: Int
switch grade {
case 100:
print("A+")
case 90...99:
print("A")
case 80...89:
print("B")
case 70...79:
print("C")
case 65...69:
print("D")
default: 
print("F")
}

*/

/**
#6

First print("The answer to life, the universe and everything")
365  print("Days in year")
1024 print("Bytes in a Kilobyte")
65: print("Some uninteresting number")
Removing default = error
*/

/**
#7

var population: Int = 10000
var message = String()

if population > 10000 {
message = "\(population) is a large town"
} else if population < 10000 && population > 5000 {
message = "\(population) is a medium size town"
} else {
message = "\(population) is a mid-size town"
}

Convert to Switch

switch population {
case 10000...1000000:
message = "\(population) is a large town"
case 5000..<10000:
message = "\(population) is a medium town"
default:
message = "\(population) is a mid-size town"
}

*/

/**
#8

let myTuple: (Int, Int) = (5, 1000000)
let myTupleSum = myTuple.0 + myTuple.1

if myTupleSum >= 15 {
print("\(myTupleSum) is greater than or equal to 15")
}

switch myTupleSum {
case 0..<15:
break
default:
if myTupleSum < 0 {
break
} else {
print("\(myTupleSum) is greater than or equal to 15")
}
}
*/

/**
#9

let studentNameAndClass = ("Ben", 3.2)
let myTupleTwo = studentNameAndClass
switch myTupleTwo{
case ("Ben", 3.2):
print("Hello \(myTupleTwo.0) from class \(myTupleTwo.1)")
default:
print("hi")
}
*/

/**
#10

var this = (1,3)
switch this {
case let (x,y) where x*2==y:
print("x*2 is equal to y")
case let (x,y) where x*3==y:
print("x*3 is equal to y")
case let (x,y):
print("Nothing is special about this tuple")
}
*/


# Conditionals

### Question 1.
What are some reasons to use a __switch__ instead of an __if__?

### Question 2.
What's missing from the switch statement below?
- a. The case statement needs to say month == 1
- b. The code is valid and not missing anything
- c. The below code will not compile because switch statements need case statements for all expected values or a default statement.

```swift
let monthNum = 3
switch monthNum {
case 1:
    print("January")
}
```

### Question 3.
Convert the if/else statement below into a switch statement.

```swift
temperatureInFahrenheit = 72

if temperatureInFahrenheit <= 40 {
    print("It's cold out.")
} else if temperatureInFahrenheit >= 85 {
    print("It's really warm.")
} else {
    print("Weather is moderate.")
}
```

### Question 4.
Change the below if/else statement into a switch statement.
```swift
let cardNum = 12
if cardNum == 11 {
    print("Jack")
} else if cardNum == 12 {
    print("Queen")
} else if cardNum == 13 {
    print("King")
} else {
    print(cardNum)
}
```

### Question 5.
Create a switch statement that will convert a number grade into a letter grade as shown below:
* 100 -> A+
* 90 - 99 -> A
* 80 - 89 -> B
* 70 - 79 -> C
* 65 - 69 -> D
* Below 65 -> F

### Question 6.
Consider the below switch statement. What should your system currently print? What happens when you change _number_ to 365? 1024? 65? What happens when you remove the __default__ clause?
```swift
let number = 42

switch number {
case 365:
    print("Days in year")
case 1024:
    print("Bytes in a Kilobyte")
case 0:
    print("Where arrays start")
case 42:
    print("The answer to life, the universe and everything")
default:
    print("Some uninteresting number")
}
```

### Question 7.
Consider the variable below called _population_ and the if-condition.
1. Add an else-if-condition that states if _population_ is less than 10000 but greater than 5000, the message changes to say it's "a medium size town".
2.  Add an else-condition where the message changes to say it's a mid-size town.
3. Convert your final if-else statement to a switch statement.

```swift
var population: Int = 10000
var message = String()

if population > 10000 {
    message = "\(population) is a large town"
}
```

### Question 8.
Complete the code below so that it prints out and tells the user if the sum of the two numbers in the tuple is at least 15.
a) Using a conditional
b) Using a switch statement

```swift
let myTuple: (Int, Int) = (5, 10)
```

### Question 9.
Complete the switch statement below.  We want it to output a personalized greeting to the student based on their name and class.

```swift
let studentNameAndClass = ("Ben", 3.2)
switch myTupleTwo{
   
}

```

### Question 10.
Consider the below switch with a tuple.
* Add a case for when _y_ is __double__ the value of _x_
* Add a case for when _y_ is __triple__ the value of _x_

```swift
switch (x,y) {
case let (x,y) where x==y :
    print("x is equal to y")
case let (x,y):
    print("Nothing is special about this tuple")
}
```

###Question 11
Write an if statement that checks to see what quadrant a point is in, then prints that quadrant.
Then write it as a switch statement
```swift
let myPoint: (Double, Double)
```

###Question 12
Write an if statement that prints out what decade of life someone is in (e.g "You are in your twenties).
Then write it as a switch statement
```swift
let nameAndBirthDate: (String, Int)
```

###Question 13
Write a switch statement that switches on a tuple with two Bools and prints what logical operators (&&, ||) could be applied to make a true expression.
```swift
let pAndQ: (Bool, Bool)
```

Next, write a switch statement that switches on a tuple with 3 Bools and prints what logical operators (&&, ||) could connect all Bools with to make a true expression.
```swift
let pAndQAndR: (Bool, Bool, Bool)
```

###Question 14
Write a switch statement that prints out the type of what it's switching on

###Question 15
Write a conditional statement that prints out whether a number is a whole number

### Question 16
 You're walking in Manhattan. Write a switch statement that switches
 on a variable named "direction" having one of the values "North", "East",
 "West", or "South" and tells you if you're on a street or avenue
 
### Question 17
 You're in the Battery and you're heading for C4Q AND you can walk on water.
 Write a switch using fallthrough to tell you you're getting warmer or colder
 based on "direction" again. It should also report if you're going
 "uptown" or "downtown" (but shouldn't report about east or west).
 
