ArrayList<Cow> cows = new ArrayList<Cow>();
void setup() {
  size(1200, 1200);
  cows.add(new Cow(0, width/2, 100, null));
}

void draw() {
  if (frameCount % 10 == 0) {
    background(0);
    ArrayList<Cow> newThisGen = new ArrayList<Cow>();
    ArrayList<Cow> deadCows = new ArrayList<Cow>();
    for (Cow cow : cows) {
      Cow dead = cow.older(1);
      if (dead != null) {
        deadCows.add(dead);
      }
    }
    cows.removeAll(deadCows);
    for (Cow cow : cows) {
      Cow newChild = cow.reproduce();
      if (newChild != null) {
        newThisGen.add(newChild);
      }
      cow.show();
    }
    cows.addAll(newThisGen);
    print("Year " + frameCount / 10 + ": ");
    print(cows.size() + "\n");
  }
}
