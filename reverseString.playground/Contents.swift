import UIKit

var aString = "Hello"
print(aString)
var reverse = String(aString.reversed())
print(reverse)


func string(aStr: String) -> String {
    var str = "" // this is an empty string
    //    print(str)
    //
    for character in aStr {
       // character is a the letter which is adding it to the empty string
        // hello
        // h + ""
        
        print(character)
      
        print(aStr)
      
        str = "\(character)" + str 
        print(str)
    }
    return str
    
}
print(string(aStr: "Hello"))


