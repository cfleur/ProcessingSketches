/* This program draws shapes as objects and can assign button functions on mouse over.
Note that if shapes overlap, it may interfere with isButton function. */

PosCenter rect1Pos;
Shape rect1;
PosCenter elli1Pos;
Shape elli1;
PosCenter elli2Pos;
Shape elli2;
color red = color(225, 0, 0);
color blue = color(0, 0, 255);
color bg = color(205, 205, 205);
color turq = color(50, 200, 200);

void setup() {
  // Set up window
  noStroke();
  size(500, 500);
  centerModeOn();

  // Initialize shapes
  rect1Pos = new PosCenter(width/2, height/2);
  rect1 = new Shape(rect1Pos, 20, 60);
  elli1Pos = new PosCenter(width-width/4, height-height/3);
  elli1 = new Shape(elli1Pos, 45, 35);
  elli2Pos = new PosCenter(width/3.5, height-height/4);
  elli2 = new Shape(elli2Pos, 150, 150);

  // Draw static shapes
}

void draw() {
  ellipse(rect1.pos.x, rect1.pos.y, 1, 1);
  rect1.isButton("rect", 125, bg);
  elli1.isButton("ellipse", red, bg);
  elli2.isButton("ellipse", turq, bg);
}


class PosCenter {
  float x;
  float y;
  PosCenter(float pass_x, float pass_y) {
    x = pass_x;
    y = pass_y;
  }
}

class Shape {
  // Valid for ellipse and rect type shapes
  PosCenter pos;
  float w;
  float h;
  Shape(PosCenter pass_pos, float pass_w, float pass_h) {
    pos = pass_pos;
    w = pass_w;
    h = pass_h;
  }
  void drawRect() {
    rect(pos.x, pos.y, w, h);
  }

  void drawEllipse() {
    ellipse(pos.x, pos.y, w, h);
  }

  boolean isButton(String shapeType, color buttonOnColor, color buttonOffColor) {
    rectMode(CENTER);
    ellipseMode(CENTER);
    float x = pos.x;
    float y = pos.y;
    println(x, "x center"); // remove println() lines when debug complete!!
    println(y, "y center");
    println(w, "w"); 
    println(h, "h");
    if (mouseX <= w/2+x && mouseX >= w/-2+x && mouseY <= h/2+y && mouseY >= h/-2+y) {
      // w/2+x, w/-2+x, h/2+y, h/-2+y because center mode is on
      println("isButton == true");
      fill(buttonOnColor);
      if (shapeType == "rect")
        drawRect();
      else if (shapeType == "ellipse")
        drawEllipse();
      else
        println("Enter either 'rect' or 'ellipse' as first arguement in isButton(String, color, color)");
      return true; // mouse is over button
    } else {
      println("isButton == false");
      fill(buttonOffColor);
      if (shapeType == "rect")
        drawRect();
      else if (shapeType == "ellipse")
        drawEllipse();
      else
        println("Enter either 'rect' or 'ellipse' as first arguement in isButton(String, color, color)");
      return false; // Mouse is not over button
    }
  }
}

void centerModeOn() {
  rectMode(CENTER);
  ellipseMode(CENTER);
  // Add other shapes which need to be centered here
}