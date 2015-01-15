Dominic Lee (eeue53)

3D Snake

Gameplay

The snake will move in its forward direction once every second. The direction
of the snake is changed useing the W,A,S,D keys. This is in relation to the bottom
face of the snake (the lighter color of face). To exit the game use the escape key
and to reset the game press enter after you have lost.

Things to metion about the game : 

- I have used a function to convert the mouse corrdinates on the screen to 
	a point arround the scene, uesing glLookAt
- There are 2 light sorces
- Timer functions are used throughout
- At game over:
	- A particle system appers
	- and a texture on a 2D plane fades in (i talked to you about 
	  this very problem)
- The snake is held in a circular array