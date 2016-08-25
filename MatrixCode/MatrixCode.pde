import java.util.Random;

Symbol[][] chars;
ArrayList<Line> lines;
int lastTime = millis();
int lastScrollTime = millis();

Symbol blank = new Symbol(' ', 0);

void setup() {
  size(1920, 1080);
  textFont(createFont("matrix code nfi.ttf", 20));
  textAlign(LEFT, TOP);
  chars = new Symbol[height / 15][width / 15];
  lines = new ArrayList<Line>();
  for (int y = 0; y < chars.length; y++) {
    for (int x = 0; x < chars[y].length; x++) {
      chars[y][x] = getRandomSymbol();
    }
  }
}

void draw() {
  clear();
  background(0);
  if (millis() - lastTime > 80) {
   lastTime = millis();
   int x = getRandomInt(0, chars[0].length);
   int y = getRandomInt(-100, 0);
   int len = getRandomInt(30, 40);
   lines.add(new Line(x, y, len, getRandomFloat(1, 2)));
  }
  if (millis() - lastScrollTime >  50) {
    lastScrollTime = millis();
    for (Line line : lines) line.y += line.speed;
  }
  for (int y = 0; y < chars.length; y++) {
   for (int x = 0; x < chars[y].length; x++) {
     if (random(1000) < 10) {
       chars[y][x].textColor = 0x6600ff00;
     }
     if (random(1000) < 7) {
       chars[y][x].textColor = 0x8800ff00;
     }
     if (random(100) < 4) {
       chars[y][x].c = getRandomChar();
     }
   }
  }
  ArrayList<Line> linesToRemove = new ArrayList<Line>();
  for (Line line : lines) {
    if (line.y - line.len >= chars.length) linesToRemove.add(line);
    for (int y = (int)line.y; y > line.y - line.len; y--) {
      if (y < 0) break;
      if (y >= chars.length) continue;
      chars[y][(int)line.x].textColor = ((0xff - ((int)(line.y - y)) * 5) << 24) + 0x0000ff00;
    }
    for (int y = (int)(line.y + 1); y < line.y + 10; y++) {
      if (y < 0) continue;
      if (y >= chars.length) break;
      chars[y][(int)line.x].textColor = 0;
    }
    if (line.y >= 0 && line.y < chars.length) chars[(int)line.y][(int)line.x].textColor = 0xffffffff;
  }
  for (Line line : linesToRemove) lines.remove(line);
  for (int y = 0; y < chars.length; y++) {
   for (int x = 0; x < chars[y].length; x++) {
     fill(chars[y][x].textColor, 255);
     text(chars[y][x].c, x * 15, y * 15 - 5);
   }
  }
}

public int getRandomInt(int begin, int end) {
  return new Random().nextInt(end - begin) + begin;
}

public float getRandomFloat(float begin, float end) {
  return new Random().nextFloat() * (end - begin) + begin;
}

public char getRandomChar() {
  return (char)getRandomInt(33, 126);
}

public Symbol getRandomSymbol() {
  return new Symbol(getRandomChar(), 0);
}