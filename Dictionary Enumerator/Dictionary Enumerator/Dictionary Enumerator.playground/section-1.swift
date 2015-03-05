// Iterate through Dictionary and add 10 to each value

import UIKit

var myDictionary = ["first":2, "second":4, "third":6, "fourth":8, "fifth":10]

for (index, value) in myDictionary{         // loop through a dictionary
    
    myDictionary[index] = value + 10
    
    
}

println(myDictionary)