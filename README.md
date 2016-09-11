# COBOL-Stack
A stack in COBOL implementing Push, Pop, and Peek operators with accompanying tests

## Usage:

    call "Stack" using by content "<Command>", by [content|reference] <Item>

## Examples:

    call "Stack" using by content "Push", by content Item
    
    call "Stack" using by content "Peek", by reference Item
    
    call "Stack" using by content "Pop", by reference Item
    
    
