
Beck’s rules of simple code. In priority order, simple code:
Runs all the tests; 
Contains no duplication; 
Expresses all the design ideas that are in the system; 
Minimizes the number of entities such as classes, methods, functions, and the like.

Of these, I focus mostly on duplication. When the same thing is done over and over, it’s a sign that there is an idea in our mind that is not well represented in the code. I try to ﬁgure out what it is. Then I try to express that idea more clearly.

the ratio of time spent reading vs. writing is well over 10:1. We are constantly reading old code as part of the effort to write new code. Because this ratio is so high, we want the reading of code to be easy, even if it makes the writing harder. Of course there’s no way to write code without reading it, so making it easy to read actually makes it easier to write. So if you want to go fast, if you want to get done quickly, if you want your code to be easy to write, make it easy to read.

The Boy Scout Rule It’s not enough to write the code well. The code has to be kept clean over time. We’ve all seen code rot and degrade as time passes. So we must take an active role in preventing this degradation. The Boy Scouts of America have a simple rule that we can apply to our profession. Leave the campground cleaner than you found it.5 If we all checked-in our code a little cleaner than when we checked it out, the code simply could not rot. The cleanup doesn’t have to be something big. Change one variable name for the better, break up one function that’s a little too large, eliminate one small bit of duplication, clean up one composite if statement. Can you imagine working on a project where the code simply got better as time passed? Do you believe that any other option is professional? Indeed, isn’t continuous improvement an intrinsic part of professionalism?

Good var naming
 elapsedTimeInDays; 
daysSinceCreation; 
daysSinceModification;
 fileAgeInDays;

## Use Solution Domain Names 
Remember that the people who read your code will be programmers. So go ahead and use computer science (CS) terms, algorithm names, pattern names, math terms, and so forth. It is not wise to draw every name from the problem domain because we don’t want our coworkers to have to run back and forth to the customer asking what every name means when they already know the concept by a different name. The name AccountVisitor means a great deal to a programmer who is familiar with the VISITOR pattern. What programmer would not know what a JobQueue was? There are lots of very technical things that programmers have to do. Choosing technical names for those things is usually the most appropriate course.

Blocks and Indenting This implies that the blocks within if statements, else statements, while statements, and so on should be one line long. Probably that line should be a function call. Not only does this keep the enclosing function small, but it also adds documentary value because the function called within the block can have a nicely descriptive name. This also implies that functions should not be large enough to hold nested structures. Therefore, the indent level of a function should not be greater than one or two. This, of course, makes the functions easier to read and understand.

**This is good** We could extract the if statement into a function named includeSetupsAndTeardownsIfTestPage, but that simply restates the code without changing the level of abstraction. So, another way to know that a function is doing more than “one thing” is if you can extract another function from it with a name that is not merely a restatement of its imple- mentation

Never use swich statements unless its a factory crating polymorphic instances
My general rule for switch statements is that they can be tolerated if they appear only once, are used to create polymorphic objects, and are hidden behind an inheritance relationship so that the rest of the system can’t see them [G23]. Of course every circum- stance is unique, and there are times when I violate one or more parts of that rule.

Don’t be afraid to make a name long. A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment. Use a naming convention that allows multiple words to be easily read in the function names, and then make use of those multiple words to give the function a name that says what it does.

Function Arguments (more than 2 is hard to test)
The ideal number of arguments for a function is zero (niladic). Next comes one (monadic), followed closely by two (dyadic). Three arguments (triadic) should be avoided where possible. More than three (polyadic) requires very special justiﬁcation—and then shouldn’t be used anyway.
Arguments are even harder from a testing point of view. Imagine the difﬁculty of writing all the test cases to ensure that all the various combinations of arguments work properly. If there are no arguments, this is trivial. If there’s one argument, it’s not too hard. With two arguments the problem gets a bit more challenging. With more than two argu- ments, testing every combination of appropriate values can be daunting.

Flag Arguments 
Flag arguments are ugly. Passing a boolean into a function is a truly terrible practice. It immediately complicates the signature of the method, loudly proclaiming that this function does more than one thing. It does one thing if the ﬂag is true and another if the ﬂag is false! In Listing 3-7 we had no choice because the callers were already passing that ﬂag in, and I wanted to limit the scope of refactoring to the function and below. Still, the method call render(true) is just plain confusing to a poor reader. Mousing over the call and seeing render(boolean isSuite) helps a little, but not that much. We should have split the function into two: renderForSuite() and renderForSingleTest().

## Dyadic Functions 
A function with two arguments is harder to understand than a monadic function. For exam- ple, writeField(name) is easier to understand than writeField(output-Stream, name).10 Though the meaning of both is clear, the ﬁrst glides past the eye, easily depositing its meaning. The second requires a short pause until we learn to ignore the ﬁrst parameter. And that, of course, eventually results in problems because we should never ignore any part of code. The parts we ignore are where the bugs will hide. There are times, of course, where two arguments are appropriate. For example, Point p = new Point(0,0); is perfectly reasonable. Cartesian points naturally take two arguments. Indeed, we’d be very surprised to see new Point(0). However, the two argu- ments in this case are ordered components of a single value! Whereas output-Stream and name have neither a natural cohesion, nor a natural ordering. 

Structured Programming Some programmers follow Edsger Dijkstra’s rules of structured programming.14 Dijkstra said that every function, and every block within a function, should have one entry and one exit. Following these rules means that there should only be one return statement in a func- tion, no break or continue statements in a loop, and never, ever, any goto statements.While we are sympathetic to the goals and disciplines of structured programming, those rules serve little beneﬁt when functions are very small. It is only in larger functions that such rules provide signiﬁcant beneﬁt. So if you keep your functions small, then the occasional multiple return, break, or continue statement does no harm and can sometimes even be more expressive than the sin- gle-entry, single-exit rule. On the other hand, goto only makes sense in large functions, so it should be avoided.

## Wordsmith it.
Writing software is like any other kind of writing. When you write a paper or an article, you get your thoughts down ﬁrst, then you massage it until it reads well. The ﬁrst draft might be clumsy and disorganized, so you wordsmith it and restructure it and reﬁne it until it reads the way you want it to read. When I write functions, they come out long and complicated. They have lots of indenting and nested loops. They have long argument lists. The names are arbitrary, and there is duplicated code. But I also have a suite of unit tests that cover every one of those clumsy lines of code. So then I massage and reﬁne that code, splitting out functions, changing names, elim- inating duplication. I shrink the methods and reorder them. Sometimes I break out whole classes, all the while keeping the tests passing. In the end, I wind up with functions that follow the rules I’ve laid down in this chapter. I don’t write them that way to start. I don’t think anyone could.

## Consider the following stretch of code: 
//does the module from the global list <mod> 
//depend on the subsystem we are part of?
 if (smodule.getDependSubsystems().contains(subSysMod.getSubSystem())) 

## This could be rephrased without the comment as 
ArrayList moduleDependees = smodule.getDependSubsystems();
String ourSubSystem = subSysMod.getSubSystem(); 
if (moduleDependees.contains(ourSubSystem)) 

The author of the original code may have written the comment ﬁrst (unlikely) and then written the code to fulﬁll the comment. However, the author should then have refactored the code, as I did, so that the comment could be removed.

The Law of Demeter There is a well-known heuristic called the Law of Demeter2 that says a module should not know about the innards of the objects it manipulates. As we saw in the last section, objects hide their data and expose operations. This means that an object should not expose its internal structure through accessors because to do so is to expose, rather than to hide, its internal structure. More precisely, the Law of Demeter says that a method f of a class C should only call the methods of these: • C • An object created by f

An object passed as an argument to f • An object held in an instance variable of C The method should not invoke methods on objects that are returned by any of the allowed functions. In other words, talk to friends, not to strangers. The following code3 appears to violate the Law of Demeter (among other things) because it calls the getScratchDir() function on the return value of getOptions() and then calls getAbsolutePath() on the return value of getScratchDir(). final String outputDir = ctxt.getOptions().getScratchDir().getAbsolutePath();

Train Wrecks This kind of code is often called a train wreck because it look like a bunch of coupled train cars. Chains of calls like this are generally considered to be sloppy style and should be avoided [G36]. It is usually best to split them up as follows:

Hybrids This confusion sometimes leads to unfortunate hybrid structures that are half object and half data structure. They have functions that do signiﬁcant things, and they also have either public variables or public accessors and mutators that, for all intents and purposes, make the private variables public, tempting other external functions to use those variables the way a procedural program would use a data structure.4 Such hybrids make it hard to add new functions but also make it hard to add new data structures. They are the worst of both worlds. Avoid creating them. They are indicative of a muddled design whose authors are unsure of—or worse, ignorant of—whether they need protection from functions or types.

## Dont return null
If you are tempted to return null from a method, consider throwing an exception or returning a SPECIAL CASE object instead. If you are calling a null-returning method from a third-party API, consider wrapping that method with a method that either throws an exception or returns a special case object.

First:
Clean tests follow ﬁve other rules that form the above acronym: Fast Tests should be fast. They should run quickly. When tests run slow, you won’t want to run them frequently. If you don’t run them frequently, you won’t ﬁnd problems early enough to ﬁx them easily. You won’t feel as free to clean up the code. Eventually the code will begin to rot. 

Independent Tests should not depend on each other. One test should not set up the condi- tions for the next test. You should be able to run each test independently and run the tests in any order you like. When tests depend on each other, then the ﬁrst one to fail causes a cas- cade of downstream failures, making diagnosis difﬁcult and hiding downstream defects. 

Repeatable Tests should be repeatable in any environment. You should be able to run the tests in the production environment, in the QA environment, and on your laptop while riding home on the train without a network. If your tests aren’t repeatable in any environ- ment, then you’ll always have an excuse for why they fail. You’ll also ﬁnd yourself unable to run the tests when the environment isn’t available. 

Self-Validating The tests should have a boolean output. Either they pass or fail. You should not have to read through a log ﬁle to tell whether the tests pass. You should not have to manually compare two different text ﬁles to see whether the tests pass. If the tests aren’t self-validating, then failure can become subjective and running the tests can require a long manual evaluation.

Timely The tests need to be written in a timely fashion. Unit tests should be written just before the production code that makes them pass. If you write tests after the production code, then you may ﬁnd the production code to be hard to test. You may decide that some production code is too hard to test. You may not design the production code to be testable.

Class dscription
We should also be able to write a brief description of the class in about 25 words, without using the words “if,” “and,” “or,” or “but.” How would we describe the SuperDashboard? “The SuperDashboard provides access to the component that last held the focus, and it also allows us to track the version and build numbers.” The ﬁrst “and” is a hint that SuperDashboard has too many responsibilities.

The Single Responsibility Principle The Single Responsibility Principle (SRP)2 states that a class or module should have one, and only one, reason to change. This principle gives us both a deﬁnition of responsibility, and a guidelines for class size. Classes should have one responsibility—one reason to change.

We want our systems to be composed of many small classes, not a few large ones. Each small class encapsulates a single responsi- bility, has a single reason to change, and collaborates with a few others to achieve the desired system behaviors.

It is a myth that we can get systems “right the ﬁrst time.” Instead, we should imple- ment only today’s stories, then refactor and expand the system to implement new stories tomorrow. This is the essence of iterative and incremental agility. Test-driven develop- ment, refactoring, and the clean code they produce make this work at the code level.

Software systems are unique compared to physical systems. Their architectures can grow incrementally, if we maintain the proper separation of concerns.

Whether you are designing systems or individual modules, never forget to use the simplest thing that can possibly work.

a design is “simple” if it follows these rules: 
• Runs all the tests 
• Contains no duplication 
• Expresses the intent of the programmer 
• Minimizes the number of classes and methods The rules are given in order of importance.

making our systems testable pushes us toward a design where our classes are small and single purpose. It’s just easier to test classes that conform to the SRP. The more tests we write, the more we’ll continue to push toward things that are simpler

During this refactoring step, we can apply anything from the entire body of knowledge about good software design. We can increase cohesion, decrease coupling, separate con- cerns, modularize system concerns, shrink our functions and classes, choose better names, and so on. This is also where we apply the ﬁnal three rules of simple design: Eliminate duplication, ensure expressiveness, and minimize the number of classes and methods.

You can express yourself by choosing good names. We want to be able to hear a class or function name and not be surprised when we discover its responsibilities. You can also express yourself by keeping your functions and classes small. Small classes and functions are usually easy to name, easy to write, and easy to understand. You can also express yourself by using standard nomenclature. Design patterns, for example, are largely about communication and expressiveness. By using the standard pattern names, such as COMMAND or VISITOR, in the names of the classes that imple- ment those patterns, you can succinctly describe your design to other developers. Well-written unit tests are also expressive. A primary goal of tests is to act as docu- mentation by example. Someone reading our tests should be able to get a quick under- standing of what a class is all about.

One of the best ways to ruin a program is to make massive changes to its structure in the name of improvement. Some programs never recover from such “improvements.” The problem is that it’s very hard to get the program working the same way it worked before the “improvement.”To avoid this, I use the discipline of Test-Driven Development (TDD). One of the cen- tral doctrines of this approach is to keep the system running at all times. In other words, using TDD, I am not allowed to make a change to the system that breaks that system. Every change I make must keep the system working as it worked before.

when refactoring, Putting things in so you can take them out again is pretty common in refactoring. The smallness of the steps and the need to keep the tests running means that you move things around a lot. Refactoring is a lot like solving a Rubik’s cube. There are lots of little steps required to achieve a large goal. Each step enables the next.

Much of good software design is simply about partitioning—creating appropriate places to put different kinds of code. This separation of concerns makes the code much simpler to understand and maintain.

Of course bad code can be cleaned up. But it’s very expensive. As code rots, the mod- ules insinuate themselves into each other, creating lots of hidden and tangled dependen- cies. Finding and breaking old dependencies is a long and arduous task. On the other hand, keeping code clean is relatively easy. If you made a mess in a module in the morning, it is easy to clean it up in the afternoon. Better yet, if you made a mess ﬁve minutes ago, it’s very easy to clean it up right now. So the solution is to continuously keep your code as clean and simple as it can be. Never let the rot get started.

Negatives are slightly harder to understand than positives [G29]. So let’s turn that if statement on its head and invert the sense of the conditional.

This is actually quite pretty. The module is separated into a group of analysis func- tions and another group of synthesis functions. They are topologically sorted so that the deﬁnition of each function appears just after it is used. All the analysis functions appear ﬁrst, and all the synthesis functions appear last.

Inheriting from classes with con- stants is an old trick that Java programmers used so that they could avoid using expres- sions like MonthConstants.January, but it’s a bad idea [J2]. MonthConstants should really be an enum.

It’s generally a bad idea for base classes to know about their derivatives.

A comment worth writing is worth writing well. If you are going to write a comment, take the time to make sure it is the best comment you can write. Choose your words carefully. Use correct grammar and punctuation. Don’t ramble. Don’t state the obvious. Be brief.

Tests Require More Than One Step You should be able to run all the unit tests with just one command. In the best case you can run all the tests by clicking on one button in your IDE. In the worst case you should be able to issue a single simple command in a shell. Being able to run all the tests is so fundamental and so important that it should be quick, easy, and obvious to do.

Every time you see duplication in the code, it represents a missed opportunity for abstraction. That duplication could probably become a subroutine or perhaps another class outright. By folding the duplication into such an abstraction, you increase the vocab- ulary of the language of your design. Other programmers can use the abstract facilities you create. Coding becomes faster and less error prone because you have raised the abstraction level.

The most obvious form of duplication is when you have clumps of identical code that look like some programmers went wild with the mouse, pasting the same code over and over again. These should be replaced with simple methods. A more subtle form is the switch case or if else chain that appears again and again in various modules, always testing for the same set of conditions. These should be replaced with polymorphism. Still more subtle are the modules that have similar algorithms, but that don’t share similar lines of code. This is still duplication and should be addressed by using the TEM- 4 5              4           5
PLATE METHOD, or STRATEGY pattern.

## Abstract base classes:
It is important to create abstractions that separate higher level general concepts from lower level detailed concepts. Sometimes we do this by creating abstract classes to hold the higher level concepts and derivatives to hold the lower level concepts. When we do this, we need to make sure that the separation is complete. We want all the lower level concepts to be in the derivatives and all the higher level concepts to be in the base class. For example, constants, variables, or utility functions that pertain only to the detailed implementation should not be present in the base class. The base class should know noth- ing about them. This rule also pertains to source ﬁles, components, and modules. Good software design requires that we separate concepts at different levels and place them in different containers. Sometimes these containers are base classes or derivatives and sometimes they are source ﬁles, modules, or components. Whatever the case may be, the separation needs to be complete. We don’t want lower and higher level concepts mixed together.

## Compact your interface
Good software developers learn to limit what they expose at the interfaces of their classes and modules. The fewer methods a class has, the better. The fewer variables a func- tion knows about, the better. The fewer instance variables a class has, the better. Hide your data. Hide your utility functions. Hide your constants and your temporaries. Don’t create classes with lots of methods or lots of instance variables. Don’t create lots of protected variables and functions for your subclasses. Concentrate on keeping interfaces very tight and very small. Help keep coupling low by limiting information.

## Feature Envy 
This is one of Martin Fowler’s code smells.6 The methods of a class should be interested in the variables and functions of the class they belong to, and not the variables and functions of other classes. When a method uses accessors and mutators of some other object to manipulate the data within that object, then it envies the scope of the class of that other object. It wishes that it were inside that other class so that it could have direct access to the variables it is manipulating.

## Static functions:
A function should not be static if there is an offchanse that it could be polymorphic in the future. Whne in doubt go for non static.

## Readable algorithms
One of the more power- ful ways to make a program readable is to break the calculations up into intermediate val- ues that are held in variables with meaningful names. More explanatory variables are generally better than fewer. It is remarkable how an opaque module can suddenly become transparent simply by break- ing the calculations up into well-named intermediate values.

## Programming is often an exploration. 
You think you know the right algorithm for something, but then you wind up ﬁddling with it, prodding and poking at it, until you get it to “work.” How do you know it “works”? Because it passes the test cases you can think of. There is nothing wrong with this approach. Indeed, often it is the only way to get a function to do what you think it should. However, it is not sufﬁcient to leave the quotation marks around the word “work.”Before you consider yourself to be done with a function, make sure you understand how it works. It is not good enough that it passes all the tests. You must know10 that the solution is correct. Often the best way to gain this knowledge and understanding is to refactor the func- tion into something that is so clean and expressive that it is obvious how it works.

## Prefere Bucket brigade functions
Each function produces a result that the next function needs, so there is no reasonable way to call them out of order. You might complain that this increases the complexity of the functions, and you’d be right. But that extra syntactic complexity exposes the true temporal complexity of the situation. Note that I left the instance variables in place. I presume that they are needed by pri- vate methods in the class. Even so, I want the arguments in place to make the temporal coupling explicit.

G33: Encapsulate Boundary Conditions Boundary conditions are hard to keep track of. Put the processing for them in one place. Don’t let them leak all over the code. We don’t want swarms of +1s and -1s scattered hither and yon. Consider this simple example from FIT: 
  if(level + 1 < tags.length) { 
    parts = new Parse(body, tags, level + 1, offset + endTag); 
    body = null; } 
Notice that level+1 appears twice. This is a boundary condition that should be encapsu- lated within a variable named something like nextLevel. 
  int nextLevel = level + 1; 
    if(nextLevel < tags.length) { 
    parts = new Parse(body, tags, nextLevel, offset + endTag); body = null;
  }


N7: Names Should Describe Side-Effects Names should describe everything that a function, variable, or class is or does. Don’t hide side effects with a name. Don’t use a simple verb to describe a function that does more than just that simple action. For example, consider this code from TestNG: 
public ObjectOutputStream getOos() throws IOException {
if (m_oos == null) { 
  m_oos = new ObjectOutputStream(m_socket.getOutputStream()); 
} 
return m_oos;
 } 
This function does a bit more than get an “oos”; it creates the “oos” if it hasn’t been cre- ated already. Thus, a better name might be createOrReturnOos