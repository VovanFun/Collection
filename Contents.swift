
import Foundation

//for number in stride(from: 0, to: 10, by: 2) {
//for number in stride(from: 0, through: 10, by: 2) {
//let charTwo = "\u{65}\u{301}"


//// Array
//var someInts = [Int]()
//var threeDoubles = Array(repeating: 0.0, count: 3)
//var shoppingList: [String] = ["Eggs", "Milk"]
//shoppingList.count
//shoppingList.append("Flour")
//shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//var firstItem = shoppingList[0]
//shoppingList[3...5] = ["Bananas", "Apples"]
//shoppingList.insert("Maple Syrup", at: 0)
//let mapleSyrup = shoppingList.remove(at: 0)
//var arr1 = [[Int]]()
//var arr2: [[Int]] = []
//var arr3 = Array(repeating: Array(repeating: 0, count: 3), count: 3)
//var arr = Array<Array<Double>>()
//for _ in 0...3 {
//    arr.append(Array(repeating:Double(), count:4))
//}
//if arr.count > 3 && arr[3].count > 3 {
//    print(arr[3][3])
//}
//var daysArray = ["SunDay","MonDay","TuesDay","WednesDay","ThursDay","FriDay","SaturDay"]
//for day in daysArray[...3]{
//    print (day)
//}
//
//
//// Set
//var letters = Set<Character>()
//letters.insert("a")
//letters = []
//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//favoriteGenres.insert("Jazz")
//favoriteGenres.count
//favoriteGenres.capacity
//favoriteGenres.contains("Rock")
//favoriteGenres.isEmpty
//
//let oddDigits: Set = [1, 3, 5, 7, 9]
//let evenDigits: Set = [0, 2, 4, 6, 8]
//let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//oddDigits.union(evenDigits).sorted() // +
//oddDigits.intersection(evenDigits).sorted() // &
//oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // -
//oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // !&
//
//
//// Dictionaries
//var namesOfIntegers = [Int: String]()
//namesOfIntegers[16] = "sixteen"
//namesOfIntegers = [:]
//var mydict : Dictionary<String,String>
//var dict1 : Dictionary<String,Int> = Dictionary<String,Int>()
//var dict2 = Dictionary<String,Int>()
//var dict3 = [String:Int]()
//
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//print([String](airports.keys))
//airports["LHR"] = "London"
//airports["LHR"] = "London Heathrow"
//if let index = airports.index(forKey: "DUB"){
//    print(index)
////    print(airports.remove(at: index))
//}
//airports.removeValue(forKey: "dd")
//let airportCodes = [String](airports.keys)
//let airportNames = [String](airports.values)

//var myDict = [(Int, String)]()
//myDict.append((49000, "Dnipro"))
//myDict.append((99000, "Lviv"))
//myDict.append((33000, "Odessa"))
//func insertDict(_ postIndex: Int, _ city: String) {
//    myDict.append((postIndex, city))
//}
//insertDict(44000, "Kharkov")
//print(myDict)



//: ### DZ 3
struct ActionsSetWithArray {
    let a : [Int]
    let b : [Int]
    
    func union() -> [Int] {
        var c = a
        for i in b {
            if !c.contains(i) {
                c.append(i)
            }
        }
        return c
    }
    
    func intersection() -> [Int] {
        var c = [Int]()
        for i in a {
            if b.contains(i) {
                c.append(i)
            }
        }
        return c
    }
    
    func subtracting() -> [Int] {
        var c = [Int]()
        for i in a {
            if !b.contains(i) {
                c.append(i)
            }
        }
        return c
    }
    
    func symmetricDifference() -> [Int] {
        var c = [Int]()
        for i in a {
            if !b.contains(i) {
                c.append(i)
            }
        }
        for i in b {
            if !a.contains(i) {
                c.append(i)
            }
        }
        return c
    }
    
}

var str = ActionsSetWithArray(a: [0,1,2,3,4,5,6,7,8,9], b: [0,1,4,9,16,25])
print(str.a, str.b)
print(str.union())
print(str.intersection())
print(str.subtracting())
print(str.symmetricDifference())

print()

class ActionsDictWithTupleArray{
    var myDict : [(Int, String)]
    
    init(_ a: [(Int, String)]) {
        self.myDict = a
    }
    
    func insertDict(_ postIndex: Int, _ city: String) {
        myDict.append((postIndex, city))
    }
    
    func union(_ b: [(Int, String)]) -> [(Int, String)] {
        var c = myDict
        var contains : Bool
        for (key, value) in b {
            contains = false
            for (k, _) in c {
                if key == k {
                    contains = true
                    break
                }
            }
            if !contains {
                c.append((key, value))
            }
        }
        return c
    }

    func intersection(_ b: [(Int, String)]) -> [(Int, String)] {
        var c = [(Int, String)]()
        for (key, value) in myDict {
            for (k, _) in b {
                if key == k {
                    c.append((key, value))
                    break
                }
            }
        }
        return c
    }

    func subtracting(_ b: [(Int, String)]) -> [(Int, String)] {
        var c = [(Int, String)]()
        var contains : Bool
        for (key, value) in myDict {
            contains = false
            for (k, _) in b {
                if key == k {
                    contains = true
                    break
                }
            }
            if !contains {
                c.append((key, value))
            }
        }
        return c
    }

    func symmetricDifference(_ b: [(Int, String)]) -> [(Int, String)] {
        let copySelf = ActionsDictWithTupleArray(b)
        return self.subtracting(b) + copySelf.subtracting(myDict)
    }
    
}

var dictClass = ActionsDictWithTupleArray([(49000, "Dnipro"), (99000, "Lviv")])
dictClass.insertDict(33000, "Odessa")
print(dictClass.union([(44000, "Kharkov"), (38000, "Kherson")]))
print(dictClass.intersection([(49000, "Dnipro"), (33000, "Kherson")]))
print(dictClass.subtracting([(49000, "Dnipro"), (33000, "Kherson")]))
print(dictClass.symmetricDifference([(49000, "Dnipro"), (38000, "Kherson")]))


//var a: Set = [0,1,2,3,4,5,6,7,8,9]
//var b: Set = [0,1,4,9,16,25]
//print(a.union(b).sorted())
//print(a.intersection(b).sorted())
//print(a.subtracting(b).sorted())
//print(a.symmetricDifference(b).sorted())











