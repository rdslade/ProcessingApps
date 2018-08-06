ArrayList<Float> nums;
float curAvg = 0;
float count = 0;
float startX;
float endX;
float numLineHeight;
PFont f;

float getNextVal() {
  float sum = 0;
  float counter = 0;
  while (sum < 1) {
    sum += random(1);
    counter += 1;
  }
  return counter;
}

float calculateAverage(ArrayList<Float> nums) {
  float total = 0;
  for (Float f : nums) {
    total += f;
  }
  return total / nums.size();
}

void setup() {
  nums = new ArrayList<Float>();
  size(1000, 500);
  f = createFont("Arial", 20, true);
  numLineHeight = 3 * height / 4;
  frameRate = 60;
}

void drawTick(float n, String textInput, boolean above, float h, color c) {
  stroke(c);
  textFont(f, 20);
  float pixelLoc = map(n, 2, 5, startX, endX);
  line(pixelLoc, numLineHeight - h/2, pixelLoc, numLineHeight + h/2);
  if (textInput != null) {
    float disHeight = 60;
    if (above) {
      disHeight *= -1;
    }
    text(textInput, pixelLoc - textInput.length() * 5, numLineHeight + disHeight);
  }
}

void drawUnitTick(float n){
   drawTick(n, str(n), false, 20, color(255)); 
}
void draw() {
  background(0);
  float next = getNextVal();
  count++;
  curAvg = ((curAvg * (count - 1)) / count) + (next / count);
  stroke(255);
  strokeWeight(5);

  startX = width / 10;
  endX = width * 9 / 10;
  line(startX, numLineHeight, endX, numLineHeight);

  drawTick(curAvg, "avg", true, 60, color(255, 0, 0));
  drawTick(next, null, false, 10, color(0, 255, 0));
  drawTick(exp(1.0), "e", false, 50, color(255));
  
  for(int i = 2; i <= 5; i++){
   drawUnitTick(i); 
  }
  textFont(f, 24);
  float textDisplayLeft = width - 350;
  float textDisplayRight = 10;
  
  text("1. Choose a random number between [0,1]", textDisplayRight, 50);
  text("2. Add random number to a running total", textDisplayRight, 100);
  text("3. When total > 1, STOP", textDisplayRight, 150);
  text("On average, how many 'picks' does it take to STOP?", textDisplayRight, 200);
  
  textFont(f, 30);
  text("e = " + str(exp(1.0)), textDisplayLeft, 50);
  text("avg = " + str(curAvg), textDisplayLeft, 100);
  text("error = " + str(curAvg - exp(1.0)), textDisplayLeft, 150);
  text("num iterations = " + str(int(count)), textDisplayLeft, 200);
  text("press 'r' to reset simulation", textDisplayRight, 250);
}

void keyPressed(){
 if(key == 'r'){
  count = 0;
  curAvg = 0;
 }
}
