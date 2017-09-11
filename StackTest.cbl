identification division.
program-id. StackTest.

*> A simple stack in COBOL

environment division.

data division.
working-storage section.
01 Item pic x(10) value spaces.
01 Result pic x(10) value spaces.

procedure division.
    move "hello" to Item
    call "Stack" using by content "Push", by content Item
    move "hola" to Item
    call "Stack" using by content "Push", by content Item
    move "bonjour" to Item
    call "Stack" using by content "Push", by content Item
    call "Stack" using by content "Pop", by reference Result
    call "AssertEquals" using Result, "bonjour", "Returned 3rd value put on stack"
    call "Stack" using by content "Pop", by reference Result
    call "AssertEquals" using Result, "hola", "Returned 2nd value put on stack"
    call "Stack" using by content "Pop", by reference Result
    call "AssertEquals" using Result, "hello", "Returned 1st value put on stack"
    call "Stack" using by content "Pop", by reference Result
    call "AssertEquals" using Result, " ", "Read past end of stack returns spaces"

    move 35 to Item
    call "Stack" using by content "Push", by content Item
    call "Stack" using by content "Push", by content "hola"
    call "Stack" using by content "Pop", by reference Result
    call "AssertEquals" using Result, "hola", "Returned 2nd new value put on stack"
    call "Stack" using by content "Pop", by reference Result
    call "AssertEquals" using Result, Item, "Returned 1st new numeric value put on stack"

    call "Stack" using by content "Push", by content "hello"
    call "Stack" using by content "Peek", by reference Result
    call "AssertEquals" using Result, "hello", "Peeked value put on stack"
    call "Stack" using by content "Peek", by reference Result
    call "AssertEquals" using Result, "hello", "Peeked value returned again"

stop run.
