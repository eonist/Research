## Strategy pattern:
Delegates functionality through a common interface, alternative to the decorator class
The strategy class serve as the delegator to concrete strategy classes
Example of strategy class is a string work, stringcheck or a stringsort class(look ths p)
Often utilizes polymorphism interfaces abstract and concrete classes and in heritage and composition.
Main purpose is to add function interchangability to classes. You can also add functions to classes at runtime as long as the interface of the function is the same


## Template pattern:
A delegation class that utilizes an abstract class to control the order that functions in sub classes are run
The class can utilize a hock function to disrupting the main algorithm flow. The order stays the same but functions can be omitted or behavior changed 
Depends on inheritance 


## Memento pattern
Saves and restores class states, can be used as undo redo and history functionality 
Becomes Truley useful when used with a dynamic flash_proxy class


## Iteration pattern
Itterates over a list of items great way to delegate functionality to other classes
Usually Has next ,next and rest
The itterqtor class restates inside a collection class that usually. Return an ittereator or reverseitterator class based on passed argument 


## Command pattern
Encapsulated functions and invocs them in a sequence.
Often used to add undo and redo. Functionality 

## Mediator pattern
Works almost like a one level down singleton class
A reference of the mediator class is passed down to sub classes an the sub classes then usually calls the mediators handle function with a state name as string. Then the handle function pareses through a list of if else function and delegates functionality to the current state with a go function


## Observer pattern
write summary

## Visitor pattern:
research


## Chain of Responsibility 	
object that can fulfill a request 

## Interpreter  
grammar and interpretation of a language