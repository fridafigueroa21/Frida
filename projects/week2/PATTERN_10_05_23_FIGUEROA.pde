import processing.pdf.*;

float freq = 0.02;  // Adjust the frequency of the sine wave
float amp = 300;    // Adjust the amplitude of the sine wave
float rotationSpeed = 0.8;  // Adjust the rotation speed

void setup() {
  size(800, 800);
  background(255);
  
  beginRecord(PDF, "MAT 236_1.pdf");
  for (int i = 0; i < 15; i++) {  // Adjust the number of iterations
    float y = 1 + sin(float(i) * freq * PI) * amp / 8;
    noFill();
    stroke(0);  // Random stroke color
    strokeWeight(.5);  // Random stroke weight
    drawShape(1, .8, y);
    drawShape(-1, .9, y);
    drawShape(-1, -.9, y);
    drawShape(1, -.8, y);
  }
  
  endRecord();
}

void draw() {
}

void drawShape(float scaleX, float scaleY, float rotationVal) {
  pushMatrix();
  translate(width / 2, height / 2);
  float mappedRotation = map(rotationVal, -1, 1, 0, 2*PI);
  scale(scaleX, scaleY);
  rotate(mappedRotation);
  ellipseMode(CORNER);
  ellipse(0, 0, 10 * rotationVal, 200);
  popMatrix();
}
