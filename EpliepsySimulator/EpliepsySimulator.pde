import java.util.ArrayList;

ArrayList<Square> squares = new ArrayList<Square>();

int timer;

boolean mouseDown = false;

int textSize = 100;

float r, g, b;

void setup() {
  size(2000, 1200);
  timer = millis();
  textSize(textSize);
}

void draw() {
  
  strokeWeight(1.5);
  stroke(255, 255, 255);
  
  //if (millis() - timer >= 1000) {
  //  timer = millis();
  //  squares.add(new Square(10, 10, 50, 8 + random(5), 3 + random(3)));
  //}
  
  if (mousePressed) {
    //if (!mouseDown) {
    //  mouseDown = true;
      squares.add(new Square(mouseX, mouseY, 30 + random(41), (8 + random(5)) * (random(3) - 1), (3 + random(3)) * (random(3) - 1), (random(100) <= 2 ? true : false)));
    //}
  }
  //else {
  //  mouseDown = false;
  //}
  
  boolean vibrate = false;
  
  if (millis() - timer >= 500) {
    r = 255 * random(2);
    g = 255 * random(2);
    b = 255 * random(2);
    vibrate = true;
    textSize(++textSize);
  }
  if (millis() - timer >= 520) {
    timer = millis();
  }
  
  background(r * 0.2, g * 0.2, b * 0.2);
  //background(r, g, b);
  
  ArrayList<Square> remove = new ArrayList<Square>();
  
  fill(r, g, b);
  
  textAlign(CENTER);
  if (vibrate) {
    text("Epilepsy Simulator", 1000 - 10, 600);
    text("Epilepsy Simulator", 1000, 600);
    text("Epilepsy Simulator", 1000 + 10, 600);
  } else {
    text("Epilepsy Simulator", 1000, 600);
  }
  
  for (Square s : squares) {
    float r = 255 * random(2);
    float g = 255 * random(2);
    float b = 255 * random(2);
    
    fill(r, g, b);
    
    s.draw(vibrate);
    if (s.done) remove.add(s);
  }
  
  for (Square s : remove) {
    squares.remove(s);
  }
}