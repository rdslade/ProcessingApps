class Cow {
  int age;
  PVector pos;
  Cow parent;
  ArrayList<Cow> children;

  Cow(int age_, float x_, float y_, Cow parent_) {
    age = age_;
    pos = new PVector(x_, y_);
    parent = parent_;
    children = new ArrayList<Cow>();
  }

  int getAge() {
    return age;
  }

  Cow older(int years) {
    age += years;
    if(age >= 6){
      return this;
    }
    return null;
  }

  void show() {
    color c;
    if (age < 4) {
      c = color(255);
    } else {
      c = color(255, 0, 0);
    }
    fill(c);
    ellipse(pos.x, pos.y, 3 * age, 3 * age);
    if (parent != null) {
      stroke(0, 0, 255);
      strokeWeight(3);
      line(this.pos.x, this.pos.y, this.parent.pos.x, this.parent.pos.y); 
      noStroke();
    }
  }

  Cow reproduce() {
    if (age >= 4) {
      float x = width / (children.size() + 2);
      float y = this.pos.y + 100;
      Cow child = new Cow(1, x, y, this);
      children.add(child);
      return child;
    }
    return null;
  }
}
