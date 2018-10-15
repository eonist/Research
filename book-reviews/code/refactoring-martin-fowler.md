When you find you have to add a feature to a program, and the program's code is not mizstructured in a convenient way to add the feature, first refactor the program to make it easy to add the feature, then add the feature.

temporary variables such as this as much as possible. Temps are often a problem in that they cause a lot of parameters to be passed around when they don't have to be. You can easily lose track of what they are there for. They are particularly insidious in long methods. Of course there is a performance price to pay; here the charge is now calculated twice. But it is easy to optimize that in the rental class, and you can optimize much more effectively when the code is properly factored. I'll talk more about that issue later in Refactoring and Performance on page 69.

Refactoring (noun): a change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its observable behavior.

Refactor (verb): to restructure software by applying a series of refactorings without changing its observable behavior.

Without a good design, you can progress quickly for a while, but soon the poor design starts to slow you down. You spend time finding and fixing bugs instead of adding new function. Changes take longer as you try to understand the system and find the duplicate code. New features need more coding as you patch over a patch that patches a patch on the original code base.

Optimizing
I've found that refactoring helps me write fast software. It slows the software in the short term while I'm refactoring, but it makes the software easier to tune during optimization. I end up well ahead.

New methods
A heuristic we follow is that whenever we feel the need to comment something, we write a method instead. Such a method contains the code that was commented but is named after the intention of the code rather than how it does it. We may do this on a group of lines or on as little as a single line of code. We do this even if the method call is longer than the code it replaces, provided the method name explains the purpose of the code. The key here is not method length but the semantic distance between what the method does and how it does it. (Conditionals and loops also give signs for extractions. Use Decompose Conditional to deal with conditional expressions. With loops, extract the loop and the code within the loop into its own method.)

New class
You can Extract Class to bundle a number of the variables. Choose variables to go together in the component that makes sense for each. For example, "depositAmount" and "depositCurrency" are likely to belong together in a component. More generally, common prefixes or suffixes for some subset of the variables in a class suggest the opportunity for a component. If the component makes sense as a subclass, you'll find Extract Subclass often is easier.

When a class is trying to do too much, it often shows up as too many instance variables. When a class has too many instance variables, duplicated code cannot be far behind.

Big class
As with a class with too many instance variables, a class with too much code is prime breeding ground for duplicated code, chaos, and death. The simplest solution (have we mentioned that we like simple solutions?) is to eliminate redundancy in the class itself. If you have five hundred-line methods with lots of code in common, you may be able to turn them into five ten-line methods with another ten two-line methods extracted from the original.

To many variables
As with a class with a huge wad of variables, the usual solution for a class with too much code is either to Extract Class or Extract Subclass. A useful trick is to determine how clients use the class and to use Extract Interface for each of these uses. That may give you ideas on how you can further break up the class.

Feature Envy 
The whole point of objects is that they are a technique to package data with the processes used on that data. A classic smell is a method that seems more interested in a class other than the one it actually is in. The most common focus of the envy is the data. We've lost count of the times we've seen a method that invokes half-a-dozen getting methods on another object to calculate some value. Fortunately the cure is obvious, the method clearly wants to be elsewhere, so you use Move Method to get it there. Sometimes only part of the method suffers from envy; in that case use Extract Method on the jealous bit and Move Method to give it a dream home.

Switch Statements 
One of the most obvious symptoms of object-oriented code is its comparative lack of switch (or case) statements. The problem with switch statements is essentially that of duplication. Often you find the same switch statement scattered about a program in different places. If you add a new clause to the switch, you have to find all these switch, statements and change them. The object- oriented notion of polymorphism gives you an elegant way to deal with this problem. Most times you see a switch statement you should consider polymorphism. The issue is where the polymorphism should occur. Often the switch statement switches on a type code. You want the method or class that hosts the type code value. So use Extract Method to extract the switch statement and then Move Method to get it onto the class where the polymorphism is needed. At that point you have to decide whether to Replace Type Code with Subclasses or Replace Type Code with State Strategy. When you have set up the inheritance structure, you can use Replace Conditional with Polymorphism. If you only have a few cases that affect a single method, and you don't expect them to change, then polymorphism is overkill. In this case Replace Parameter with Explicit Methods is a good option. If one of your conditional cases is a null, try Introduce Null Object.

Lazy Class 
Each class you create costs money to maintain and understand. A class that isn't doing enough to pay for itself should be eliminated. Often this might be a class that used to pay its way but has been downsized with refactoring. Or it might be a class that was added because of changes that were planned but not made. Either way, you let the class die with dignity. If you have subclasses that aren't doing enough, try to use Collapse Hierarchy. Nearly useless components should be subjected to Inline Class.

Refused Bequest 
Subclasses get to inherit the methods and data of their parents. But what if they don't want or need what they are given? They are given all these great gifts and pick just a few to play with. The traditional story is that this means the hierarchy is wrong. You need to create a new sibling class and use Push Down Method and Push Down Field to push all the unused methods to the sibling. That way the parent holds only what is common. Often you'll hear advice that all superclasses should be abstract.

Unit tests
This framework is used for unit tests, so I should mention the difference between unit tests and functional tests. The tests I'm talking about are unit tests. I write them to improve my productivity as a programmer. Making the quality assurance department happy is just a side effect. Unit tests are highly localized. Each test class works within a single package. It tests the interfaces to other packages, but beyond that it assumes the rest just works. 

Functional tests 
are a different animal. They are written to ensure the software as a whole works. They provide quality assurance to the customer and don't care about programmer productivity. They should be developed by a different team, one who delights in finding bugs. This team uses heavyweight tools and techniques to help them do this.

Adding More Tests 
Now we should continue adding more tests. The style I follow is to look at all the things the class should do and test each one of them for any conditions that might cause the class to fail. This is not the same as "test every public method," which some programmers advocate. Testing should be risk driven; remember, you are trying to find bugs now or in the future. So I don't test accessors that just read and write a field. Because they are so simple, I'm not likely to find a bug there.

Just enough tests
This is important because trying to write too many tests usually leads to not writing enough. I've often read books on testing, and my reaction has been to shy away from the mountain of stuff I have to do to test. This is counterproductive, because it makes you think that to test you have to do a lot of work. You get many benefits from testing even if you do only a little testing. The key is to test the areas that you are most worried about going wrong. That way you get the most benefit for your testing effort. It is better to write and run incomplete tests than not to run complete tests.

Use if else inline
if (basePrice > 1000) discountFactor = 0.95;
else discountFactor = 0.98;

Explaining Variable
if ( (platform.toUpperCase().indexOf("MAC") > -1) && (browser.toUpperCase().indexOf("IE") > -1) && wasInitialized() && resize > 0 ) 
{ do something }

 final boolean isMacOs -1; = platform.toUpperCase().indexOf("MAC") > 
final boolean isIEBrowser = browser.toUpperCase().indexOf("IE") -1; 
final boolean wasResized = resize > 0; 
if (isMacOs && isIEBrowser && wasInitialized() && wasResized) 
{ do something }

Refrence Temp variables only once
Many other temporaries are used to hold the result of a long-winded bit of code for easy reference later. These kinds of variables should be set only once. That they are set more than once is a sign that they have more than one responsibility within the method. Any variable with more than one responsibility should be replaced with a temp for each responsibility. Using a temp for two different things is very confusing for the reader. make temp variables final to ensure it is only set once. I admit that I don't use final much, because I don't find it helps much with clarity for short methods. I use it with a long method to help me see whether anything is changing the parameter.

Move method
A method is, or will be, using or used by more features of another class than the class on which it is defined. Create a new method with a similar body in the class it uses most. Either turn the old method into a simple delegation, or remove it altogether. Moving methods is the bread and butter of refactoring. I move methods when classes have too much behavior or when classes are collaborating too much and are too highly coupled. 

Extract class:
Such a class is one with many methods and quite a lot of data. A class that is too big to understand easily. You need to consider where it can be split, and you split it. A good sign is that a subset of the data and a subset of the methods seem to go together. Other good signs are subsets of data that usually change together or are particularly dependent on each other. A useful test is to ask yourself what would happen if you removed a piece of data or a method. What other fields and methods would become nonsense?

Encapsulation
One of the keys, if not the key, to objects is encapsulation. Encapsulation means that objects need to know less about other parts of the system. Then when things change, fewer objects need to be told about the change—which makes the change easier to make.

Seperate gui and business logic
A well-layered system separates code that handles the user interface from code that handles the business logic. It does this for several reasons. You may want several interfaces for similar business logic; the user interface becomes too complicated if it does both; it is easier to maintain and evolve domain objects separate from the GUI; or you may have different developers handling the different pieces. Although the behavior can be separated easily, the data often cannot. Data needs to be embedded in GUI control that has the same meaning as data that lives in the domain model. User interface frameworks, from model-view-controller (MVC) onward, used a multitiered system to provide mechanisms to allow you to provide this data and keep everything in sync.

Encapsulate collections
Encapsulate Collection A method returns a collection. Make it return a read-only view and provide add remove methods. Motivation Often a class contains a collection of instances. This collection might be an array, list, set, or vector. Such cases often have the usual getter and setter for the collection. However, collections should use a protocol slightly different from that for other kinds of data. The getter should not return the collection object itself, because that allows clients to manipulate the contents of the collection without the owning class's knowing what is going on. It also reveals too much to clients about the object's internal data structures. A getter for a multivalued attribute should return something that prevents manipulation of the collection and hides unnecessary details about its structure. How you do this varies depending on the version of Java you are using. In addition there should not be a setter for collection: rather there should be operations to add and remove elements. This gives the owning object control over adding and removing elements from the collection. With this protocol the collection is properly encapsulated, which reduces the coupling of the owning class to its clients. 
 an add and remove method for the collection. Initialize the field to an empty collection. Compile.. 
