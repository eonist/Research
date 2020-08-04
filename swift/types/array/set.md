Sets and arrays both store objects of your choosing, but they have four important differences:

Sets do not store objects in the order they add them.
Instead, they are stored in a way to make them fast to find, which means finding items in sets is extremely efficient.
Sets store each item precisely once.
All items you want to store in a set must conform to Hashable.
As a result, you should use a set rather than an array if all the following criteria are true:

You intend to add each item only once. Sets never allow duplicates.
You don’t care about the order of the items in the set.
You don’t need to use APIs that require arrays.
You’re storing Hashable types, either your own or one of Swift’s built-in types likes strings and integers. Sets use hash values for fast look up of items.
