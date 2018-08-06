import controlP5.*;

int numPoints = 0;

void setup(){
 size(1040,1040);
 
 ControlP5 cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("numPoints").setPosition(100,50).setRange(20,150);
}

void draw(){
  background(0);
  int offset = frameCount * 10;
  for(int i = 0; i < numPoints; i++){
    float x = map(i, 0, numPoints, 0, width);
    noStroke();
    fill(255, 0, 0);
    
    float angle = map(x + offset, 0, 1040, 0, TWO_PI);
    
    float y_sin = map(sin(angle), -1, 1, 0, height);
    float y_cos = map(cos(angle), -1, 1, 0, height);
    
    fill(255, 0, 0);
    ellipse(x, y_sin, 10, 10);
    fill(0, 255, 0);
    ellipse(x, y_cos, 10, 10);
  }
  int numDashes = 20;
  for(int i = 0; i < numDashes; i++){
   float x = ((((map(i, 0, numDashes, 0, width) - offset) % width) + width) % width);
   int dashHeight = 20;
   fill(255);
   rect(x, height/2 - (dashHeight -5)/2, 3, dashHeight);
  }
  fill(255);
  rect(0, height/2, width, 5);
}
