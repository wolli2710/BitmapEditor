README
==============
* Ruby version: Ruby 2.0.0-p643

install rspec for tests
* gem install rspec

you can run the example with:
* ./start.sh

Commands
--------------
Finally there are 8 supported commands:

* I M N - Create a new M x N image with all pixels coloured white (O).
* C - Clears the table, setting all pixels to white (O).
* L X Y C - Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* F X Y C - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
* S - Show the contents of the current image
* X - Terminate the session
* P - Print the currently used commands during this session

Example
--------------
In the example below, > represents input

```html
> I 5 6 
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> F 3 3 J
> V 2 3 4 W
> H 3 4 2 Z
> S
JJJJJ
JJZZJ
JWJJJ
JWJJJ
JJJJJ
JJJJJ
> P
I 5 6
L 2 3 A
S
F 3 3 J
V 2 3 4 W
H 3 4 2 Z
S
P
```