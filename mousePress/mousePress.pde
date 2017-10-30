/* Processing example of using mousePressed() function to change 
the state of the sketch. When the mouse is pressed, the colors of the
background and the shape are switched.

2017 Processing 3.3.6
Location: https://github.com/cfleur/ProcessingSketches/mousePress/mousePress.pde
*/

boolean clicked = false; // This variable allows us to switch between one state 
                         // and another when the mouse is pressed
void setup() {
  size(200, 200);
  frameRate(15); 
}

void draw() {

  if (clicked) {
    fill(225); // light grey
    background(25); // dark grey
  } else {
    fill(25); // dark grey
    background(225); // light grey
  }
  ellipse(width/2, height/2, width/4, height/4);
}
void mousePressed() {
  // This code gets executed every time the mouse is pressed.

  if (clicked == false)
    clicked = true;
  else
    clicked = false;
  println(clicked); // Check console to see state values of "clicked".
}