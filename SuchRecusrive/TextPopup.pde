public class TextPopup {
  
  public float x, y;
  public int colorVal;
  public String text;
  
  public TextPopup(float x, float y, int colorVal, String text) {
    this.x = x;
    this.y = y;
    this.colorVal = (int)colorVal;
    this.text = text;
  }
  
  public void draw() {
    fill(0xff000000 + colorVal);
    textFont(comicSans);
    textAlign(CENTER, CENTER);
    text(text, x, y);
  }
  
}