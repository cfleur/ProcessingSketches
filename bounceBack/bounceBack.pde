/* "Bounce Back" 
 a hack of this intro to P3D https://processing.org/reference/size_.html */

int i = 2;
boolean countdown = false;

void setup() {

  size(700, 800, P3D);  // Specify P3D renderer
  background(53);
  frameRate(10);
}

void draw() {

  // With P3D, we can use z (depth) values...
  background(53);
  line(0, 0, 0, width, height, -100);
  line(width, 0, 0, width, height, -100);
  line(0, height, 0, width, height, -100);
  directionalLight(5, 5, 255, -1, -1, -1);
  ambientLight(175, 75, 75);
  //...and 3D-specific functions, like box()
  pushMatrix();
  translate(width/2, height/2);

  rotateX(PI/i);
  rotateY(PI/i);
  fill(100 );
  box(175);
  if (countdown) i--;
  else i++;
  if (i >=20) countdown = true;
  if (i <=2) countdown = false;
  println(i);
  popMatrix();
}