```swift
//Calculates the remainder of expression1 divided by expression2

4 % 2
-4 % 3//-1
-4 % -3//-1

//The sign of the modulo result matches the sign of the dividend (the first number). For example, -4 % 3 and -4 % -3 both evaluate to -1.

print(12 % 5)    // 2
print(4.3 % 2.1) // 0.0999999999999996
print(4 % 4)     // 0


/*The first trace returns 2, rather than 12/5 or 2.4, because the modulo (%) operator returns only the remainder. The second trace returns 0.0999999999999996 instead of the expected 0.1 because of the limitations of floating-point accuracy in binary computing.*/
```