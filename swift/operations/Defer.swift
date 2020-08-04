### Defer
The point of defer is if you have multile deallocate or close calls in the code. defer is always called last in the scope etc

[https://nshipster.com/guard-and-defer/](https://nshipster.com/guard-and-defer/)

- Another thing to keep in mind is that defer blocks can’t break out of their scope. So if you try to call a method that can throw, the error can’t be passed to the surrounding context.
- Using defer to explicitly alter a program’s flow, rather than to clean up allocated resources
/*
Specifying Cleanup Actions
You use a defer statement to execute a set of statements just before code execution leaves the current block of code. This statement lets you do any necessary cleanup that should be performed regardless of how execution leaves the current block of code—whether it leaves because an error was thrown or because of a statement such as return or break. For example, you can use a defer statement to ensure that file descriptors are closed and manually allocated memory is freed.
A defer statement defers execution until the current scope is exited. This statement consists of the defer keyword and the statements to be executed later. The deferred statements may not contain any code that would transfer control out of the statements, such as a break or a return statement, or by throwing an error. Deferred actions are executed in reverse order of how they are specified—that is, the code in the first defer statement executes after code in the second, and so on.
Note: defer seems a little like an anti-pattern
*/
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
}

//The above example uses a defer statement to ensure that the open(_:) function has a corresponding call to close(_:).


//very good article on defer: https://www.hackingwithswift.com/new-syntax-swift-2-defer
