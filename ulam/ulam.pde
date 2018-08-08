float spacing = 0;
int gridLen = 10;
float fillSize = 0;

float fontSize = 0;
boolean showText = false;
color textColor = color(0);

float toff = 0;
float tdiff = .01;

char currentMode = 'p';

int gridLimit = 150;
boolean pretty = true;
color red = color(255, 0, 0);
color primeColor;
color compositeColor = color(255);

PFont f;
void setup() {
  size(600, 800);
  f = createFont("Arial", 20, true);
  updateGridLen(0);
  background(0);
}

void showInstructions() {
  textFont(f, 20);
  fill(255);
  float xPos = width / 10;
  float yPos = 50;
  text("s - show text", xPos, yPos);
  text("UP - zoom in", xPos, yPos += 25);
  text("DOWN - zoom out", xPos, yPos += 25);
  text("SHIFT - change color mode", xPos, yPos += 25);

  xPos = 7 * width / 10;
  yPos = 25;
  text("p - prime numbers", xPos, yPos);
  text("e - even numbers", xPos, yPos += 25);
  text("o - odd numbers", xPos, yPos += 25);
  text("[n] - perfect nth numbers", xPos, yPos += 25);
  text("c - clear pattern", xPos, yPos += 25);
}

void draw() {
  background(0);
  showInstructions();
  spiral(gridLen, gridLen);
}

void spiral(int X, int Y) {
  translate(width/2, (height + 200)/2);
  int x = 0;
  int y = 0;
  int dx = 0;
  int dy = -1;

  for (int i = 1; i < pow(max(X, Y), 2); i++) {
    if ((-X/2)<x && x<=(X/2) && (-Y/2)<y && y<=(Y/2)) {
      boolean match = matchPattern(i);
      if (match) {
        if (pretty) {
          float r = 255 * noise(toff);
          float g = 255 * noise(toff + i);
          float b = 255 * noise(toff + i / 2);
          primeColor = color(r, g, b);
        }

        fill(primeColor);
      } else {     
        fill(compositeColor);
      }
      ellipse(x * spacing, y * spacing, fillSize, fillSize);
      if (showText) {
        fill(textColor);
        textFont(f, fontSize);
        float xdiv = 8 / str(i).length();
        float textX = x * spacing - fillSize / xdiv;
        float textY = y * spacing + fillSize / 8;
        text(i, textX, textY);
      }
    }
    if (x==y || (x<0 && x==-y) || (x>0 && x==1-y)) {
      int temp = dx;
      dx = -1 * dy;
      dy = temp;
    }
    x = x + dx;
    y = y + dy;
  }
  toff += tdiff;
}

boolean isPrime(int n) {
  //check if n is a multiple of 2
  if (n%2==0 && n != 2) return false;
  //if not, then just check the odds
  for (int i=3; i*i<=n; i+=2) {
    if (n%i==0)
      return false;
  }
  return true;
}

boolean isEven(int n) {
  return n % 2 == 0;
}

boolean isOdd(int n) {
  return !isEven(n);
}

boolean isPerfectNumber(long input, char power)
{
  int potPower = Character.getNumericValue(power);
  float inversePower = 1.0/potPower;
  long closestRoot = (long) pow(input, inversePower);
  return input == pow(closestRoot, potPower);
}

boolean isRandomOdd(int n) {
  if (n % 2 == 0) {
    return false;
  } else {
    if (random(1) < .5) {
      return true;
    } else {
      return false;
    }
  }
}



boolean matchPattern(int x) {
  switch (currentMode) {
  case 'p': 
    return isPrime(x);
  case 'e': 
    return isEven(x);
  case 'o':
    return isOdd(x);
  case 'c':
    return false;
  case 'r':
    return isRandomOdd(x);
  }
  return isPerfectNumber(x, currentMode);
}

void updateGridLen(int change) {
  gridLen += change;
  if (gridLen <= 0) {
    gridLen = 5;
  }
  if (gridLen > gridLimit) {
    gridLen = gridLimit;
    print("Capped at " + gridLimit);
  }
  spacing = 750 / (gridLen - 1);
  fillSize = 800 / gridLen;
  fontSize = 300 / gridLen;
}


void keyPressed() {
  if (key == 's') {
    showText = !showText;
    return;
  }
  if (keyCode == DOWN) {
    updateGridLen(5);
    return;
  }
  if (keyCode == UP) {
    updateGridLen(-5);
    return;
  }
  if (keyCode == SHIFT) {
    pretty = !pretty;
    primeColor = red;
    return;
  }
  currentMode = key;
}
