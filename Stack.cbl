identification division.
program-id. Stack.

*> Implements a stack in COBOL
*> Operators are: Pop, Push, and Peek

data division.
working-storage section.
01 StackTable is global.
    02 StackItem pic x(20) occurs 1 to 50 times depending on ItemsInStack.
01 ItemsInStack pic 99 value zero is global.

linkage section.
    01 Command pic x any length.
    01 Item pic x any length.

procedure division using Command, Item.
Main section.
    evaluate function trim(Command)
        when "Push" perform PushItemOntoStack
        when "Pop"  perform PopItemOffStack
        when "Peek" perform PeekWhichItemIsOnTopOfStack
    end-evaluate
    goback
    .

PushItemOntoStack section.
    add 1 to ItemsInStack
    move Item to StackItem(ItemsInStack)
    .

PeekWhichItemIsOnTopOfStack section.
    move StackItem(ItemsInStack) to Item
    .

PopItemOffStack section.
    if ItemsInStack less than 1 then
        move spaces to Item
    else
        move StackItem(ItemsInStack) to Item
        move spaces to StackItem(ItemsInStack)
        subtract 1 from ItemsInStack
    end-if
    .

end program Stack.
