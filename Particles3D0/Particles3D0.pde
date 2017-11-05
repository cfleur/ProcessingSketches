PVector origin;
PVector instantiate0, instantiate1;
ParticleSystem particlesys0, particlesys1;
float zCoord = ((height/2) / tan(PI*30.0 / 180.0)*3);
//PVector systemOrigin;


void setup() {
  size(700, 700, P3D);
  frameRate(15);
  origin = new PVector(width/2, height/2, 0); // sets the origin to the center 
  instantiate0 = new PVector(0, -100, 0); // location to spawn object
  instantiate1 = new PVector(0, -110, -10); // location to spawn object
  particlesys0 = new ParticleSystem(instantiate0);
  particlesys1 = new ParticleSystem(instantiate1);
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
  translate(instantiate0.x, instantiate0.y, instantiate0.x);
  text("Mouse position represents camera position (x,y).\nHold shift key to toggle z.\nHold enter key to apply wind.", -width/2, 10);
  popMatrix();

  PVector g = new PVector(0, 0.1, 0);
  particlesys0.addForce(g);
  particlesys1.addForce(g.mult(0.1));

  if (keyPressed) {
        PVector wind = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
        particlesys0.addForce(wind); // spheres
        particlesys1.addForce(wind); // cubes

  }

  particlesys0.addParticle(random(3, 8)); // spheres
  particlesys0.startSys();

  particlesys1.addParticleCube(random(3, 8)); // cubes
  particlesys1.startSys();

  popMatrix();
}

//void mousePressed() {
//  pushMatrix();
//  translate(origin.x, origin.y, origin.x);
//  systemOrigin = new PVector(mouseX, mouseY, 0);
//  particlesys = new ParticleSystem(systemOrigin);   
//  particlesys.addParticle(random(3, 8));
//  particlesys.startSys();
//  popMatrix();
//}

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


  // z manipulation ----- ! not working
  if (mousePressed) {

        // z manipulation
        if (mouseY >= height/2)
          c = (map(mouseY, height/2, height, 0, height/2)/2) / tan(PI*30.0 / 180.0);
        else if (mouseY < height/2)
          c = (map(mouseY, height/2, 0, 0, height/2)/2) / tan(PI*30.0 / 180.0);
        else c = (height/2) / tan(PI*30.0 / 180.0);
        
  }
  
else c = (height/2) / tan(PI*30.0 / 180.0);

        camera(a, b, c, 
          width/2.0, height/2.0, 0, 
          0, 1, 0);

        directionalLight(a-100, b-100, c-100, 
          width/2.0, height/2.0, 0);

        ambientLight(a-100, b-100, c-100);
 
}