# COBOL-Stack
A stack in COBOL implementing Push, Pop, and Peek operators with accompanying tests

## Usage:

    call "Stack" using by content "<Command>", by [content|reference] <Item>

## Examples:

```
call "Stack" using by content "Push", by content Item
    
call "Stack" using by content "Peek", by reference Item
    
call "Stack" using by content "Pop", by reference Item
```
    
## Running the test using GnuCOBOL:

To run the tests you'll also need to download https://github.com/mikebharris/COBOL-Test-Suite and include it in the compilation:

```
$ cobc -free -x StackTest.cbl Stack.cbl path/to/COBOL-Test-Suite/AssertEquals.cbl
$ ./StackTest 
Passed: Returned 3rd value put on stack
Passed: Returned 2nd value put on stack
Passed: Returned 1st value put on stack
Passed: Read past end of stack returns spaces
Passed: Returned 2nd new value put on stack
Passed: Returned 1st new numeric value put on stack
Passed: Peeked value put on stack
Passed: Peeked value returned again
$
```
