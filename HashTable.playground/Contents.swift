import UIKit


/*
 Hashable
 
 
 */
 var buckets = Array(repeating: 0, count: 2)

// hashValue is a built-in hash functin
// returns a hash value for a key
// its possible to get a negative number
// how to fix negatives - take the absolute value of the operation
let shaniyaIndex = abs("Shaniya".hashValue % buckets.count)
let JasiahIndex = abs("Jasiah".hashValue % buckets.count)
let patrickIndex = abs("Patrick".hashValue % buckets.count)
let mommaIndex = abs("Momma".hashValue % buckets.count)

print("goes in \(shaniyaIndex) index")
print("goes in \(JasiahIndex) index")
print("goes in \(patrickIndex) index")
print("goes in \(mommaIndex) index")

var dict = [String: Int]()
dict["Sweden"] = 1

// +++++++++++++ Implemnet Hash Table +++++++++++++++++++++++
// ex: HashTable< String, Person, RandomType, Int >(capacity: 4)
struct HashTable <Key: Hashable, Value> {
    
    // key value pairs = Element
    // (key, value) e.x - "Shaniya" : 23
    private typealias Element = (key: Key, value: Value )
    
    // collision resolution being implemented using chaining
    private typealias Bucket = [Element]
    
    // could also be a linked list but here we are using a array.
    private var buckets: [Bucket]
    
    //private var count = 0 // if you want tp acces this outside even though it private
    
    // you would do this
    private (set) var count = 0 // getter is public, but the set value can only be set inside of here
    
    
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
        // e.x buckets = [ [], [], [(key: "Shaniya": 23)], [] ]
    }
    
    // method to return index where key will be stored
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count) // the location
    }
    
    // method to search for a value  given a key
    func valueForKey(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for element in buckets[index] {
            // this is going through the chain to see where the key is
            if element.key == key {
                return element.value
            }
        }
        return nil // if the value cannot be found
    }
    
   
    
    
    // method to update a value for a given key
    
    mutating func update(value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        //buckets[index].enumerated() - gives access to the index
        // i is the inner array - the chain array in a matrix
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                // this only works if key has a value
                let oldValue = element.value
                    // update the current value
                buckets[index][i].value = value // this changes the value.
                // would not update it here because the value ALREADY exists.
                return oldValue // to know the value you are replacing.
            }
        }
        // if the key does not have a value THEN
            // its a tuple that is what we are appending
        buckets[index].append((key: key, value: value))
        count += 1
        return nil // to signify there wasnt an existing value
        
    }
    // method to remove element at given key
    mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i) // remove the value
                count -= 1 // decrease the amount in the bucket
                return element.value
            }
        }
      // if we dont find it then
            return nil
    }

    
    // we can have multiple subscrpt methods taking in a variaty of arguments
    subscript(key: Key) -> Value? { // allows for subscripting into the dictionary instead of the other way we did below
           get{
               return valueForKey(forKey: key)
           } set {
            if let value = newValue {
                update(value: value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
           }
       }
    
}

// test hash table


// key is String and the vlaue is an Int and compacity is 4
var hashTable = HashTable<String, Int>(capacity: 4)

hashTable["Shaniya"] = 21
//hashTable.update(value: 21, forKey: "Shaniya")
hashTable.update(value: 36, forKey: "Brother")



hashTable.count

print(hashTable)

print("")
//hashTable.removeValue(forKey: "Shaniya") //1

hashTable["Shaniya"] = nil

print(hashTable)

print("")
if let age = hashTable["Alex"] {
    print("\(age)exist")
} else {
    print("does not exist")
}

print("")
// nil caolescing
let age = hashTable["cameron"] ?? 100 //
print(age)
