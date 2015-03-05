// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var anotherStr = "Simon"

var thirdStr = str + anotherStr

for character in str {
    
    println(character)
}

var newString = "Test String" as NSString

var subString = newString.substringToIndex(4)

var subString2 = (str as NSString).substringToIndex(6)

var endingString = newString.substringFromIndex(5)

var endingString2 = newString.substringWithRange(NSRange(location: 7, length: 4))

if newString.containsString("Test") {
    // do some shit with a valid response
}

newString.componentsSeparatedByString(" ")






