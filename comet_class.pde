class Comet {
  int tailLength;
  PVector loc;
  PVector vel;
  PVector acc;
  PVector[] locs;
  int hue;
  int sat;
  int bright;
  int alpha;
  boolean stillAlive;

  Comet(int _tailLength) {
    tailLength = _tailLength;
    stillAlive = true;
    if (coloration == 0 || coloration == 1) {
      hue = frameCount%360;
    }
    if (coloration == 2) {
      hue = makeItThisHue;
    }
    sat = makeItThisSat;
    bright = makeItThisBright;
    alpha = makeItThisAlpha;

    if (startMode == 0) {
      loc = new PVector(random(width), random(height));
    }
    else {
      loc = new PVector(origin.x,origin.y);
    }
    vel = new PVector(0, 0);
    acc = new PVector(random(-.5, .5), random(-.5, .5));
    locs = new PVector[tailLength];
    for (int i = 0; i < locs.length; i++) {
      locs[i] = new PVector(loc.x, loc.y);
    }
  }

  void display() {

    for (int i = 0; i < locs.length; i++) {

      fill(hue, sat, bright, alpha);

      ellipse(locs[i].x, locs[i].y, i, i);
    }
  }

  void update() {
    if (coloration == 0) {
      hue = frameCount%360;
    }
    vel.add(acc);
    loc.add(vel);
    acc = new PVector(random(-.5, .5), random(-.5, .5));
    for (int i = 0; i < locs.length-1; i++) {
      locs[i] = locs[i+1];
    }
    locs[locs.length-1] = new PVector(loc.x, loc.y);
  }
  void edgeCheck() {
    if ((loc.x > width*2 || loc.x < -width || loc.y > height * 2 || loc.y < -height)) {
      stillAlive = false;
    }
  }
}

