identification division.
program-id. Stack.

*> Implements a stack in COBOL
*> Operators are: Pop, Push, and Peek

data division.
working-storage section.
    01 StackTable is global.
        02 StackItem pic x(20) occurs 1 to 50 times.
    01 ItemsInStack pic 99 value zero is global.

linkage section.
    01 Command pic x any length.
    01 Item pic x any length.

procedure division using Command, Item.

    evaluate function trim(Command)
        when "Push" perform PushItemOntoStack thru EndPushItemOntoStack
        when "Pop"  perform PopItemOffStack thru EndPopItemOffStack
        when "Peek" perform PeekWhichItemIsOnTopOfStack thru EndPeekWhichItemIsOnTopOfStack
    end-evaluate
    goback.

PushItemOntoStack.
    add 1 to ItemsInStack
    move Item to StackItem(ItemsInStack).
EndPushItemOntoStack.

PeekWhichItemIsOnTopOfStack.
    move StackItem(ItemsInStack) to Item.
EndPeekWhichItemIsOnTopOfStack.

PopItemOffStack.
    if ItemsInStack less than 1 then
        move spaces to Item
    else
        move StackItem(ItemsInStack) to Item
        move spaces to StackItem(ItemsInStack)
        subtract 1 from ItemsInStack
    end-if.
EndPopItemOffStack.

end program Stack.
