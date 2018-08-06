int investigating = 1;
int offset = 10;
int numPoints = 100;
int iteration = numPoints - investigating + offset;
float pointsX[] = new float[numPoints];
float interVal[] = new float[numPoints];
float pointsY[] = new float[numPoints];
float derX[] = new float[numPoints];
float interDerVal[] = new float[numPoints];
float derY[] = new float[numPoints];
boolean buttonHover = false;
boolean running = false;
boolean runningHover = false;
boolean resetHover = false;
Polynomial poly;
void setup(){
  size(1500, 1000);
  background(0);
  ArrayList<Float> p = new ArrayList<Float>();
  p.add(.3333333333333); //x^3
  p.add(3.0); //x^2
  p.add(0.0); //x
  p.add(0.0); //1
  poly = new Polynomial(p);
  preCalc();
}
void draw(){
   int divisible = 3;
   if(running){
     divisible = 1;
   }
   if(frameCount % divisible == 0){
      clear();
      
      drawButtons();
      noStroke();
      fill(255);
      rect(0,height/2,width, 1);
      rect(width/2,0,1,height);
      translate(width/2, height/2);
      for(int i = 0; i < numPoints; i++){
       ellipse(pointsX[i], pointsY[i], 5,5);
      }
      for(int i = numPoints - 1; i > 0; i--){
        fill(0, 255, 0);
        if(i > numPoints - investigating)
          ellipse(derX[i], derY[i], 10, 10);
      }
      stroke(255, 0, 0);
      strokeWeight(5);
      if(iteration < 0){
        noLoop();
        return;
      }
      if(numPoints - investigating > iteration){
        float startX = pointsX[iteration];
        float startY = pointsY[iteration];
        PVector line = new PVector(pointsX[numPoints - investigating] - startX, pointsY[numPoints-investigating] - startY);
        fill(255, 0, 0);
        ellipse(pointsX[numPoints - investigating], pointsY[numPoints-investigating], 15, 15);
        line.mult(5);
        stroke(0,0,255);
        line(startX, startY, startX+line.x, startY+line.y);
        iteration++;
      }
      else{
        if(running){
          investigating++;
          iteration = numPoints - (investigating + offset);
        }
      }
    }
}

void mousePressed(){
  if(buttonHover){
    investigating++;
    iteration = numPoints - (investigating + offset);
  }
  if(runningHover){
    running = !running;
    investigating++;
    iteration = numPoints - (investigating + offset);
  }
  if(resetHover){
    reset();
  }
}
void preCalc(){
    double max = Double.NEGATIVE_INFINITY;
    for(int i = 0; i < numPoints; i++){
     float x = map(i, 0, numPoints, -width/2, width/2);
     pointsX[i] = x;
     float val = -1*poly.poly(x/100);
     interVal[i] = val;
     if(abs(val) > max){
      max = abs(val); 
     }
    }
    for(int i = 0; i < numPoints; i++){
     float y = map(interVal[i], (float)-max, (float)max,-height/2, height/2);
     pointsY[i] = y;
    }
    for(int i = 1; i < numPoints; i++){
      max = Double.NEGATIVE_INFINITY;
      float investigatingX = pointsX[i];
      float dY = pointsY[i] - pointsY[i - 1];
      float y = dY / (investigatingX - pointsX[i-1]);
      interDerVal[i] = y;
      if(abs(y) > max){
        max = abs(y);
      }
    }
    for(int i = 1; i < numPoints; i++){
      float investigatingX = pointsX[i];
      float y = map(interDerVal[i], (float)-max, (float)max, -height/2, height/2);
      derX[i] = investigatingX;
      derY[i] = y;
    }
}

void drawButtons(){
  textSize(40);
  int button1X = 50;
  int button1Y = 50;
  int w1 = 100;
  int h1 = 75;
  fill(255, 0, 255);
  noStroke();
  rect(button1X, button1Y, w1, h1);
  buttonHover = mouseX >= button1X && mouseX <= button1X + w1 && mouseY >= button1Y && mouseY <= button1Y + h1;
  fill(255);
  text("STEP", button1X, button1Y);
  
  int button2X = 200;
  int button2Y = 50;
  int w2 = 100;
  int h2 = 75;
  fill(0, 255, 255);
  noStroke();
  rect(button2X, button2Y, w2, h2);
  runningHover = mouseX >= button2X && mouseX <= button2X + w2 && mouseY >= button2Y && mouseY <= button2Y + h2;
  fill(255);
  if(!running){
    textSize(20);
    text("CONTINUE", button2X, button2Y);
  }
  else{
    textSize(40);
    text("STOP", button2X, button2Y);
  }
  
  int button3X = 350;
  int button3Y = 50;
  int w3 = 100;
  int h3 = 75;
  fill(255, 0, 255);
  noStroke();
  rect(button3X, button3Y, w3, h3);
  resetHover = mouseX >= button3X && mouseX <= button3X + w3 && mouseY >= button3Y && mouseY <= button3Y + h3;
  fill(255);
  textSize(36);
  text("RESET", button3X, button3Y);
  
}

void reset(){
  investigating = 1;
  iteration = numPoints - (investigating + offset);
}
