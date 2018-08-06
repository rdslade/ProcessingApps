int totalPoints = 0;
int totalInCircle = 0;
float offset;
float scale = .75;
float pi_guess;
float diameter;
PFont f;

void setup() {
  size(1250, 1000);
  f = createFont("arial", 20, true);
  background(0);
  offset = height * scale / 5;
  translate(width / 2 - offset, height / 2);

  diameter = height * scale;
  noStroke();
  fill(255, 0, 0);
  rect(-diameter / 2, -diameter / 2, diameter, diameter);
  fill(255);
  ellipse(0, 0, diameter, diameter);
}

void draw() {
  translate(width / 2 - offset, height / 2);
  for (int i = 0; i < 10; i++) {
    float x = random(- diameter / 2, diameter / 2);
    float y = random(- diameter / 2, diameter / 2);

    stroke(0, 255, 0);
    strokeWeight(8);
    point(x, y);
    PVector newPoint = new PVector(x, y);  
    if (circleContains(newPoint, diameter / 2)) {
      totalInCircle ++;
    }
    totalPoints++;
    pi_guess = 4.0 * totalInCircle / totalPoints;

    textFont(f, 20);
    float rightText = width - 200;

    //text("points inside circle = " + str(totalInCircle), 0, 0);
    //text("total points = " + str(totalPoints), 400, 0);
  }
  println(pi_guess);
}

boolean circleContains(PVector pointPos, float radius) {
  return sqrt(pow(pointPos.x, 2) + pow(pointPos.y, 2)) <= radius;
}
