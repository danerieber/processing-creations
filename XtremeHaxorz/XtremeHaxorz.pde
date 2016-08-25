String[] haxText;
String text;

int index, scroll;

boolean startScroll = false;

float lineProgress = 0;

void setup() {
  size(2000, 1200);
  haxText = loadStrings("hax-code.txt");
  textSize(32);
  textFont(createFont("Courier New", 32));
  fill(0, 255, 0);
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < index; i++) {
    if ((index - i) * 40 >= 1100) startScroll = true;
    String hax = haxText[i];
    String xah;
    if (i + 1 == index) {
      xah = hax.substring(0, (int)((lineProgress / 9) * hax.length()));
    } else {
      xah = hax;
    }
    text(xah, 10, (i + 1) * 40 - scroll);
  }
}

void keyReleased() {
  lineProgress++;
  if (lineProgress >= 10) {
    lineProgress = 0;
    index++;
    if (startScroll) scroll += 40;
  }
}