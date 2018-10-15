### Api design confession of a java developer 

-Cluelessness is positiv, one canot understand everything because the brain is finit, but being able to manuver shallowly is as important as deep knowlege of things.

-Avoid setters as much as possible when designing api

-Object oriented languages ezpress how nature works, by having a mamal class and have cat and dog classes subclassing mamal class, this is whyobject oriented languages are so good at explaining real world 

-Dont expose deep hirarchies. In essense subclassing is just a switch statement, ==once this statment gets to complex its hard for the user to use it.==

-If the subclassing is deeper than two levels. Stop and ask yourself if its just for subclass reuse. Keep in mind the readability of the api. And the inplace issue. See p. 115 in api design

-If you want to be carefull you should never add a method to a subclassable api class

-In api classes Never add methods to classes others can implement

-strive for selectiv cluelessness, and selectiv deep knowlege

- Locality of packages should be organized in a way that the most used classed are easy to find and packages that are less used should be tucked away somewhere 89/20 rule applies

- You can improve your planing skils if tests are written early.

- The more you expose of your apy the less flexible and harder to evolve it becomes.

- To prevwnt inherentance confusion make use of final functions in superclasses.

- Rewrite methods with many meanings into methods with clear meanings:
An abstract protected function clearly communicatrs to the user that it should be overriden.
A public / protected final function clearly communicates that it should be called not pveridden. Api design is about communication. The problem with methpds that can be overidden and called from the subclass  is that they can easily br misued.
Add table from screenshots here

- Functional programming will come, its easy to cose for multicore processors, its beaitifull and geometric, but the learning curve is steep and is bot thought in schools and its unknown when its time is due. Haskell is such a language

- Apply imutabilty whenever possible **avoid setters as much as possible**, the more static the api code is the more clueless the user can be. 

Api should be ballenced between:
Simplicity, robustness, correctness, evolution readiness

Even the slightest difference in initial factors, can lead to completly different sets of suggestions on how best solving problems. Think of the universe as an analogy, all laws of physics could have been totaly different if the universe inital factors were different during the start of the big bang.

An api that is naturally easy to use, is better than an api that has many ways  to be misused.

Ease of use is more important than correctness, think about array = thefilestream.read() annology.

When designing an api you should make simple things easy, while making complex things possible. Dont scare away newcommers, 

In striving towards a simple api, dont treat your users as ideots

Hide complex functionality, in different sub packages than sipmle functionality class are located

Module version dependensy: To maintainbackward compatebility you can introduce switchbased divoded functionality accprding to what version is passed in witht the cobstructor argumebt. If version 1 do this if version 2 do this. 

Good api documentation is the facade that can shield the user from internal complexity and thus integrate cluelessness into their programing

The less is more design approche: use factory classes to not expose constructors, 
Provide classes that dont subclass. This is the defencive approch

Pro
Its nice to explore other "good" developers thoughts

Cons
This guy could benifit from building other apis than just netbeans, its evident that is base of knowlefe is rich but not very broad. He makes recomendations that are not very universally applicable.
Way to long and repetative.
Hard to plow through.
