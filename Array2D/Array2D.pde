float [][] vertices;
int spacing = 50;

void setup() {
  ellipseMode(CENTER);
  size(400, 600);
  background(25);
  frameRate(15);
  vertices = new float[int(width)][int(height)];
  for (int i =spacing; i<vertices.length; i+=spacing) {
    for (int j=spacing; j<vertices[i].length; j+=spacing) {
      vertices[i][j] = (i+j)/2;
    }
  }
}

void draw() {      
  for (int i =spacing; i<vertices.length; i+=spacing) {
    for (int j=spacing; j<vertices[i].length; j+=spacing) {
      stroke(vertices[i][j]);
      fill(vertices[i][j]);
      strokeWeight(vertices[i][j]/(spacing));
      // uncomment one or both of the following lines
      point(i,j);
     // ellipse(vertices[i][j],vertices[i][j],i, j);
    }
  }
}