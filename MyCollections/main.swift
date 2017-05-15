//
//  main.swift
//  MyCollections
//

import Foundation

struct MySet<Value : Hashable> {
    
    private var capasity = 5
    private var array : Array<Value?>
    
    
    init() {
        array = Array<Value?>(repeatElement(nil, count: capasity))
    }
    
    mutating func insert(value : Value)
    {
        let index = abs(value.hashValue % capasity)
        self.array[index] = value
    }
    
    func get(value : Value) -> Value?
    {
        let index = abs(value.hashValue % capasity)
        return array[index]
    }
    
    mutating func delete(value : Value) -> Value?
    {
        let index = abs(value.hashValue % capasity)
        let value = array[index]
        array[index] = nil
        return value
    }
    
    func all()-> [Value]
    {
        let allElems = array.flatMap({$0})
        return allElems
    }
}





var dict = MySet<String>()

dict.insert(value: "first")
dict.insert(value: "second")
dict.insert(value: "third")


print(dict.all())


print(dict.delete(value: "first") ?? "not found")


print(dict.delete(value: "first") ?? "not found")


print(dict.get(value: "second") ?? "not found")
print(dict.delete(value: "second") ?? "not found")
print(dict.get(value: "second") ?? "not found")
