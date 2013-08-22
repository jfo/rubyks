[![Gem Version](https://badge.fury.io/rb/rubyks.png)](http://badge.fury.io/rb/rubyks)

This is a software model of a Rubik's cube, providing a dynamic data structure with which to describe the state and orientation of any cube in any legal position. 

The little helper program "interface" provides a simple ascii graphical way to interact with a cube. You can also manipulate the cube move by move and get immediate feedback.
More info is in the "help" command in interface.rb.

Below find information on how the data is formatted, refer to the documentation for a list of methods. Normal cube nomenclature can be used, with the exception of x' to mean reverse- simply replace the apostrophe with an "r".

I have included a set of solver methods that work every time, although pretty ineffciently. If you come across an edge case, please let me know!

It's my hope that some people will use this nomenclature to write more efficient solving algorithms than mine. My intent was to reproduce my own thought process when solving, and I am not a speedcuber, I just know one basic way to solve the cube and wanted to see if I could make my program run that same routine (more or less).  


DATA STRUCTURE:

The @cube attribute contains 6 arrays of 8 elements, each array describes one side of the cube like so:

    @cube[0] - top
    @cube[1] - left
    @cube[2] - back
    @cube[3] - right
    @cube[4] - front
    @cube[5] - bottom

The first element @cube[x][0] in any array describes the center square of that face, and remains static in relation to the other sides, just as a real cube's center square would. 

The remaining array elements from [1] - [8] start at "12 o'clock" and move clockwise. Thus: Even numbers are middle cubies and odd numbers are always corner cubies.

"12 o'clock" is constant amongst all sides of the cube, and refers to what "north" would be if the cube was unfolded into two dimensions like so:

        1
    5,4,0,2
        3

When cube orientation procedures are applied, the "address" of each side remains consistent with the above diagram, even as the sides themselves represent different numbers. (The sides could just as easily be assigned any symbol or string or whatnott, just as long as each side started off all the same thing, the cube would be in a legal state).

For example: if you created a new cube and then applied Cube#turn, the sides would appear like so:

        4
    5,3,0,1
        2

But the address of the location of these sides would remain static. This is so that complex move combinations can be applied to a cube regardless of its orientation to the "viewer."
