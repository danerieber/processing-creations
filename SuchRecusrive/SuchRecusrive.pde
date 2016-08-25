import java.util.List;
import java.util.ArrayList;

public static final float equTriHeightRatio = (float)Math.sqrt(0.75f);
public static final String[] dogePhrases = new String[]{"much wow", "such recurzive triengl", "many infenite", "such pleazing", "very geomitry", "many prosessing", "much doge", "many trienglez", "wow", "very recurzive", "??", "Copyright (C) Dane Rieber 2015"};
public PFont comicSans;
public PImage doge;
public PImage what;

EquTri start;
float initialWidth;
int timer = millis();
int textPopupTimer = timer;
int textPopupRemoveTimer = timer + 9000;
int startTime = timer;

List<TextPopup> textPopups;

void setup() {
  size(1200, 1040);
  start = new EquTri(0, 0, width);
  initialWidth = start.getWidth();
  doge = loadImage("doge.jpg");
  what = loadImage("what.jpg");
  comicSans = createFont("Comic Sans MS", 32);
  textPopups = new ArrayList<TextPopup>();
}

void draw() {
  if (millis() - startTime < 2000) {
    clear();
  
    background(255);
    stroke(0);
    strokeWeight(2);
    
    tint(255, 255 - (((float)millis() - (float)startTime) / 2000f) * 255f);
    image(doge, 0, 0, width, height);
    tint(255, 255);
    return;
  }
  if (millis() - timer >= 10) {
    timer = millis();
    clear();
  
    background(255);
    stroke(0, 255, 0);
    strokeWeight(2);
    
    image(what, 0, 0, width / 4, height / 4);
    image(what, width * (3f / 4f), 0, width / 4, height / 4);
    
    textFont(comicSans);
    
    fill(0, 255, 0);
    drawTriangles(start, 7);
    
    for (TextPopup tp : textPopups) {
      tp.draw();
    }
  
    start.width += 16;
    start.x -= 8;
  
    if (start.width >= initialWidth * 2) {
      start = new EquTri(0, 0, width);
    }
  }
  if (millis() - textPopupTimer >= 3000) {
    textPopupTimer = millis();
    textPopups.add(new TextPopup(random(0, width), random(0, height), (int)random(0, 0xffffff), dogePhrases[(int)random(0, dogePhrases.length)]));
  }
  if (millis() - textPopupRemoveTimer >= 3000) {
    textPopupRemoveTimer = millis();
    textPopups.remove(0);
  }
}

void drawTriangles(EquTri start, int num) {
  if (start.x + start.getWidth() < 0 || start.x > width || start.y + start.getHeight() < 0 || start.y > height) return;
  
  EquTri tri1 = start.clone();
  tri1.setWidth(tri1.getWidth() / 2);
  EquTri tri2 = tri1.clone();
  EquTri tri3 = tri1.clone();
  
  tri1.y += start.getHeight() - tri1.getHeight();
  
  tri2.x += start.getWidth() / 4;
  
  tri3.x += start.getWidth() / 2;
  tri3.y += start.getHeight() - tri3.getHeight();
  
  if (num > 0) {
    drawTriangles(tri1, num - 1);
    drawTriangles(tri2, num - 1);
    drawTriangles(tri3, num - 1);
  } else {
    tri1.draw();
    tri2.draw();
    tri3.draw();
  }
}