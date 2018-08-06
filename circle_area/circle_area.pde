
int numPortions = 1;

void setup() {
  size(1000, 1000);
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(0);
  fill(255);
  float d = width * .6;

  float start = PI / 2 - PI / numPortions;
  float angle = TWO_PI / numPortions;
  float origX = -width / 2 + d / numPortions + 10;
  float origY = 0;
  float x = origX;
  float y = origY;
  for (int i = 0; i < numPortions; i++) {
    fill(map(i, 0, numPortions, 0, 255), 255, 255);
    noStroke();
    arc(x, y, d, d, start, start+angle);
    float dangle = cos(angle / 2) * d/2;
    if (i % 2 == 0) {
      y = y + dangle;
      start += PI;
      //angle += PI;
    } else {
      y = y - dangle;
      start -= PI;
      //angle -= PI;
    }
    x = x + sin(angle / 2) * d/2;
  }
  stroke(255);
  strokeWeight(5);
  if (numPortions > 1) {
    translate(-width / 2, -height /2);
    line(10, height / 2, 10 + d / 2 * PI, height / 2);
  } 
  else {
    noFill();
    arc(origX, origY, d, d, 0, PI);
  }
} 

void keyPressed(){
 if(keyCode == UP){
  numPortions++; 
 }
 if(keyCode == DOWN){
  numPortions--;  
 }
}
