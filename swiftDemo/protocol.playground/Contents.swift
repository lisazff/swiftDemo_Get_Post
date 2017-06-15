//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Generator {
    associatedtype members
    func next() -> members?
}

var items = [10,20,30].makeIterator()
while let x = items.next() {
    print(x)
}

for lists in [1,2,3].map( {i in i*5}) {
    print(lists)
}

print([100,200,300])
print([1,2,3].map({i in i*10}))