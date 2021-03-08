# Memorize

This is the first project of Stanford CS193p spring quarter 2020.

This is my personal follow up of the lectures and assignments, which are now open to the public.

## Lecture 1

### Computed properties

Struct's or class' property that is calculated on access. In the next example, `body` is a calculated property:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

In this case `body` is a read-only calculated property. 

See:
* [Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#)

### "some" keyword

The `some` keyword is used to indicate that a value has an <em>opaque type</em>. 

See:
* [Opaque types](https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html)
* [The "Some" Keyword In Swift](https://learnappmaking.com/some-swift-opaque-types-how-to/)

## Lecture 2

### MVVM

Model-View-ViewModel

Model: should be UI independant (data + logic). Model structs or classes should not import SwiftUI, for example. It's the source of truth regarding the state of the application.

View: should reflects the Model. The data should flow from the Model to the View and not the other way (not really true). View should be stateless and its desired to be declarative. It should be reactive to the model, every time the Model changes the View needs to update.

ViewModel: binds the Model to the View. It might do some interpretation of the Model data and prepare it for the View. Tries to notice changes in the model. Publish the model changes so the Views can notice them, but does not inform any View directly, the Views are the ones that subscribe to the ViewModel. It process intent, that intent is the user intent to change the model. That intent processing might end in a modification of the model.

### Types

#### Struct and class

Both have properties. Properties can be stored, which can be contants or variables (`let` and `var`), and computed.

Both can have functions. There's a special function called `init`, an initializer, like a constructor. Actually a struct or class can have many initializers, each one with different parameters.

| struct                     			| class                      	    	|
|:------------------------------------- | -------------------------------------:|
| value type               		    	| reference type                    	|
| copied when passed             		| passed via "pointers"             	|
| **copy on write**          			| reference counted                 	|
| functional programming 		    	| object oriented programming       	|
| no inheritance            			| single inheritance                	|
| "free" init initialize all vars   	| "free" init initialize no vars    	|
| mutability must be explicit (`var`)   | always mutable                    	|

See:
* [Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

### Generics

See:
* [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

### Functions as types

See:
* [Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
* [Clousures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)

## Lecture 3

### Protocols

Protocols are similar to Java interfaces, but properties can also be included to its definition.

It's also possible to add defaut implementations of functions via extensions.

See:
* [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

### Extensions

Extensions let us:
* Add new functions implementations to classes and structs.
* Add default implementations to protocols functions.
* Make a struct or class conform to a protocol.

Example of the last case:
```swift
struct Boat {
	...
}

...

extension Boat: Moveable {
	// implement Moveable's functions and properties
}
```

In the example, `Boat` didn't conform to `Moveable` protocol, but then, maybe in another source file or even another project, we decided that `Boat` should conform to `Moveable` protocol, so we implement the corresponding functions and properties, using the corresponding syntax, and now `Boat` does conform to the protocol.

See:
* [Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

### Generics, protocols & extensions

With protocols and extensions we can extend structs and classes capabilities that use generics given that the generic types conforms to a given protocols. This is a powerful feature not usually seen in other languges.

Example: `Array` is a struct that is defined using generics. We can use protocols and extensions capabilities to define the following function:

```swift
extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id {
                return index
            }
        }
        return nil
    }
}
```

That will extend `Array` capabilities, so now we can find the first index of an element in an array that has the same id of the element passed in the argument, given that both the array's elements and the one in the argument conforms to the `Identifiable` protocol.

See:
* [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

### Layout

## Lecture 4

### Enums

See:
* [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)

### Optionals

See:
* [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) (Optionals part specifically)
* [Optional Chaining](https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html)