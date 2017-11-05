PVector origin;
PVector instantiate;
ArrayList<Particle> particleList;
Particle particle;
float zCoord = ((height/2) / tan(PI*30.0 / 180.0)*3);


void setup() {
  size(700, 700, P3D);
  frameRate(15);
  origin = new PVector(width/2, height/2, 0); // sets the origin to the center 
  instantiate = new PVector(0, -100, 0); // location to spawn object
  particleList = new ArrayList<Particle>();
}


void draw() {
  background(80);
  cameraMan();

  // Set origin
  pushMatrix();
  translate(origin.x, origin.y, origin.x);
  strokeWeight(1);
  line(-width, 0, 0, width, 0, 0); // x axis
  line(0, -height, 0, 0, height, 0); // y axis
  line(0, 0, -zCoord, 0, 0, zCoord); // z axis
  line(-width, 100, 0, width, 100, 0); // x axis + 100y
  line(-width, 200, 0, width, 200, 0); // x axis + 200y


  // Set instantiat location
  pushMatrix();
  translate(instantiate.x, instantiate.y, instantiate.x);
  text("Mouse position represents camera position (x,y).\nHold spacebar to toggle z coming soon.", -width/2, 10);
  popMatrix();

  particleList.add(new Particle((random(5, 15)), instantiate));
  for (int i = 0; i < particleList.size(); i++) {
    Particle particle = particleList.get(i);
    particle.updateParticle();
    particle.drawParticle();

    if (particle.livesOver() == true) {
      println(" life over. index =  ", i);
      particleList.remove(i);
      if (i > 0)
        i--;
      println("reset index = ", i);
    }
  }

  popMatrix();
}

void cameraMan() {

  // Camera manipulation
  float a, b, c;

  // x manipulation
  if (mouseX >= width/2)
    a = (width/2)-(map(mouseX, width/2, width, 0, width/2));
  else if (mouseX < width/2)
    a = (width/2)+(map(mouseX, width/2, 0, 0, width/2));
  else a = width/2;

  // y manipulation
  if (mouseY >= height/2)
    b = (height/2)-(map(mouseY, height/2, height, 0, height/2));
  else if (mouseY < height/2)
    b = (height/2)+(map(mouseY, height/2, 0, 0, height/2));
  else b = height/2;

  // z manipulation
  if (keyPressed == true) {
    println("key presses");
    if (key == CODED) {
      if (keyCode == SHIFT) {
        if (mouseY >= height/2)
          c = (map(mouseY, height/2, height, 0, height/2)/2) / tan(PI*30.0 / 180.0);
        else if (mouseY < height/2)
          c = (map(mouseY, height/2, 0, 0, height/2)/2) / tan(PI*30.0 / 180.0);
        else c = (height/2) / tan(PI*30.0 / 180.0);
      }
    }
  }
c = (height/2) / tan(PI*30.0 / 180.0);
  camera(a, b, c, 
    width/2.0, height/2.0, 0, 
    0, 1, 0);

  directionalLight(a-100, b-100, c-100, 
    width/2.0, height/2.0, 0);

  ambientLight(a-100, b-100, c-100);
}

class Particle {
  float radius;
  PShape globe;
  PVector loc;
  PVector vel;
  PVector acc;
  PVector instanceloc;
  PVector life;

  Particle(float radius_, PVector instanceloc_) {
    radius = radius_;
    globe = createShape(SPHERE, radius_);
    globe.setStrokeWeight(0);
    instanceloc = instanceloc_;
    loc = new PVector(random(-10, 10), 0, 0);
    vel = new PVector(random(-1, 1), 0, random(-1, 1));
    acc = new PVector(0, 0.1, 0);
    life = new PVector(0, 0, 0);
    loc.add(instanceloc);
  }


  void updateParticle() {
    println("life = ", life); // very large numbers ??
    println("loc = ", loc);
    println("vel = ", vel);
    println("acc = ", acc);

    life.y=-(instanceloc.y-loc.y);
    vel.add(acc);
    loc.add(vel);
    vel.limit(8);

    if (life.y >= 100.0 && life.y < 200.0) {
      println("life 1 over");
      globe.setFill(color(200, 100, 100));
    } else if (life.y >= 200.0) {
      println("life 2 over");
      globe.setFill(color(100, 200, 100));
    } else globe.setFill(color(100, 100, 200));
  }

  void drawParticle() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    shape(globe);
    popMatrix();
  }

  boolean livesOver() {
    if (life.y >= 300.0) {
      println("livesOver");
      return true;
    } else return false;
  }
}