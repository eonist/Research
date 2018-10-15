**Effective debugging requires that we take these steps:** 
1. Work out why the software is behaving unexpectedly. 
2. Fix the problem. 
3. Avoid breaking anything else. 
4. Maintain or improve the overall quality (readability, architecture, test coverage, performance, and so on) of the code. 
5. Ensure that the same problem does not occur elsewhere and can- not occur again.

**Logging**
• Logging obscures the code, making it difﬁcult to see the wood for the trees. 
• Logging can suffer from the same problems as comments—as the code evolves, often the logging isn’t updated to match, meaning that you can’t trust what it says and making it worse than useless. 
• No matter how much logging you add, it’s never what you need. The next time you ﬁnd yourself debugging in that area, you’ll just have to add more, and if you leave it in the code when you’re done, you just exacerbate the ﬁrst two problems.

**Work on a Different Problem in the Same Area** 
Are there any other bugs that you can reproduce in the same area? If so, even if they aren’t (on the face of things) as serious or as urgent as the one you’re currently chasing, it might be worth attacking them instead. There are two reasons why this might help. 
-First, this can be a good way to tidy up the code in the area. You may ﬁnd that the problem you were really looking for was being masked by other issues. Get them out of the way, and you can see what you were originally looking for more clearly. 
-Second, working on a problem that you can reproduce is an excellent way of gaining a better understanding of the code in general. There’s an excellent chance that this increased understanding will provide some insight that will enable you to ﬁnd the key to reproducing the problem you originally started looking for. And even if none of this helps, the worst that happens is that you end up ﬁxing a few less urgent bugs.

**Deadreconing** 
What you’re aiming to do is to “think yourself into the software,” exe- cuting it in your imagination. At each step, think about what could go wrong, which might explain the bug you’re trying to track down.

**Diagnosis**
Open-minded at the same time as methodical, creative at the same time as thorough—as with so many other aspects of software development, effective bug ﬁxing is all about ﬁnding the appropriate balance between these apparently contradictory demands.

**Binary chop**
If you need to find a bug in a million lines of code. Half your sear by chopping it in two equal parts
1. Try one half if the bug is not there it must be in the other half, now chop this in two and do thos over and over. It will take no more then 20 chops and the chanse of finding th bug is far more likly than 1 in 1 mill.

**Boundry search**
If the differences didn’t come to light during reproduction, it might prove helpful to “ﬁnd the boundaries” of the bug. If you can identify several similar ways of running the software, some of which reproduce the problem and some of which don’t, the chances are that it will teach you something.

**Bug fixing**
• Bug ﬁxing involves three goals: 
• – Fix the problem. 
• – Avoid introducing regressions. 
• – Maintain or improve overall quality (readability, architecture, test coverage, and so on) of the code. 
• Start from a clean source tree.
• Ensure that the tests pass before making any changes. 
• Work out how you’re going to test your ﬁx before making changes. 
• Fix the cause, not the symptoms.
• Refactor, but never at the same time as modifying functionality.

The Five Whys A useful trick when performing root cause analysis is to ask “Why?” ﬁve times. For example: • The software crashed. Why? 
• The code didn’t handle network failure during data trans- mission. Why? 
• There was no unit test to check for network failure. Why? 
• The original developer wasn’t aware that he should cre- ate such a test. Why? 
• None of our unit tests check for network failure. Why? 
• We failed to take network failure into account in the origi- nal design. 
Why ﬁve? It’s just a rule of thumb—sometimes you will need fewer steps, sometimes more. And sometimes it won’t help at all (it will help you identify only the root causes you already know about). But it can be helpful, and ﬁve seems to be about right in most cases.

**The project that you are working on will have its own set of norms, for example:** 
• Coding standards 
• Testing standards 
• Documentation standards 
• Reporting tracking processes
• Design guidelines 
• Performance requirements

refactoring crucially depends upon the support of an extensive suite of automated tests. Without tests, you’re not refactoring. You’re hacking.

**Bug Blitz** 
A popular strategy adopted by some teams is to institute a bug blitz (sometimes called a bug fest or similar). Some relatively short period (a day, a week, or maybe even an iteration) is put aside during which time everyone on the team works on nothing but bug ﬁxing. The object of the exercise is to decrease the number of outstanding bugs as much as possible in the time available, irrespective of their priority. Often, this means the simple bugs—the ones that might otherwise be overlooked as too unimportant—receive time and attention. Done well, a bug blitz can have both practical and psychological bene- ﬁts. It can help by simply getting the number of bugs down to a man- ageable level, helping you see the wood for the trees. And it can give a jaded or demoralized team a sense that they’re making progress.It’s a technique that needs to be used sparingly and carefully, however. A bug blitz can be fun for a short period—everyone pulling together, the bug count visibly decreasing, shared pizza paid for by the company. But it’s fun only for a short period; it can quickly become wearing. We all need to feel as though we’re making progress, and nothing but bug ﬁxing for weeks on end will wear anyone down. You also need to bear in mind that the purpose of a bug blitz is to improve the overall quality. That means you don’t get to scrimp on your normal processes—the checks and balances are there for a reason and are just as applicable during a bug blitz.

**Bug fixing**
Detect bugs as early as possible, and ﬁx them as soon as they come to light. 
• Act as though bug-free software was an attainable goal, but tem- per perfectionism with pragmatism. 
• If you ﬁnd yourself faced with a poor quality codebase, do the following: 
– Recognize there is no silver bullet. 
– Make sure that the basics are in place ﬁrst. 
– Separate clean code from unclean, and keep it clean. 
– Use bug triage to keep on top of your bug database. 
– Incrementally clean up bad code by adding tests and refac- toring.

**Automated Tests:**
-Unambiguous pass fail: 
Each test outputs a single bit—pass or fail. No shades of gray, no qualitative output, no interpretation required. Just a simple yes or no.

**- Self-contained:**   
No setup required before running a test. Before it runs, it sets up whatever environment it needs automatically, and just as important, it undoes any changes to the environment after- ward, leaving everything as it found it. 

**- Single-click to run all the tests: **  
All tests can be run in one step without interfering with each other. As with a single test, the output of the complete test suite is a simple pass or fail—pass if every test passes, fail otherwise. 

- Comprehensive coverage: It’s easy to prove that achieving complete coverage for any nontrivial 
body of code is prohibitively expen- sive. But don’t allow that theoretical limitation to put you off—it is possible to achieve close enough to complete coverage as to make no practical difference.1