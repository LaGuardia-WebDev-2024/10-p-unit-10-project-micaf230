void setup() {
  size(400, 360);
  noStroke();
  drawBackground();
  drawTrees();
  drawFlowers();
}

void drawBackground() {
  for (int y = 0; y < height; y++) {
    color top = color(173, 216, 230);   // sky blue
    color middle = color(144, 238, 144); // green
    color bottom = color(255, 228, 240); // soft pink
    color current;

    if (y < height / 2) {
      // From blue to green
      float percent = map(y, 0, height / 2, 0, 1);
      current = lerpColor(top, middle, percent);
    } else {
      // From green to pink
      float percent = map(y, height / 2, height, 0, 1);
      current = lerpColor(middle, bottom, percent);
    }

    stroke(current);
    line(0, y, width, y);
  }
}

void drawTrees() {
  for (int x = 40; x < width; x += 80) {
    fill(160, 82, 45); // brown trunk
    rect(x - 5, 140, 10, 30);

    fill(34, 139, 34, 150); // green tree leaves
    ellipse(x, 130, 40, 40);
    ellipse(x - 15, 135, 30, 30);
    ellipse(x + 15, 135, 30, 30);
  }
}

void drawFlowers() {
  String[] flowers = {"🌸", "🌼", "🌺", "🌷", "💐", "🌻"};

  for (int y = 200; y < height; y += 20) {
    for (int x = 0; x < width; x += 25) {
      int i = int(random(flowers.length)); // pick a random flower
      textSize(random(18, 30));
      text(flowers[i], x + random(-5, 5), y + random(-5, 5));
    }
  }
}
