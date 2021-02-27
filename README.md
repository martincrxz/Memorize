# Memorize

This is the first project of Stanford CS193p spring quarter 2020.

This is my personal follow up of the leactures and assignments, which are now open to the public.

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

On [https://docs.swift.org/swift-book/LanguageGuide/Properties.html#](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#) there's information about all types of properties.

### "some" keyword

The `some` keyword is used to indicate that a value has an <em>opaque type</em>. See [The "Some" Keyword In Swift](https://learnappmaking.com/some-swift-opaque-types-how-to/).

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

## Lecture 3

## Lecture 4

