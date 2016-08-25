public class Square {
  
  public static final int WIDTH = 2000, HEIGHT = 1200;
  
  public final PImage doge = loadImage("doge.jpg");
  
  float x, y, s, xVel, yVel;
  
  int bounces;
  
  public boolean done = false;
  
  boolean isDoge;
  
  public Square(float x, float y, float s, float xVel, float yVel, boolean isDoge) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.xVel = xVel;
    this.yVel = yVel;
    bounces = 0;
    this.isDoge = isDoge;
  }
  
  public void draw(boolean vibrate) {
    if (bounces >= 2) {
      fill(255, 255, 255);
      rect(x, y, s * 5, s * 5);
      done = true;
    }
    
    if (x <= 0 || x + s >= WIDTH) {
      xVel = -xVel;
      bounces++;
    }
    if (y <= 0 || y + s >= HEIGHT) {
      yVel = -yVel;
      bounces++;
    }
    
    x += xVel;
    y += yVel;
    
    if (vibrate) {
      //rect(x - 10, y, s, s);
      //rect(x + 10, y, s, s);
      //rect(x + 10, y, s, s);
      if (isDoge) {
        image(doge, x + 10, y, s, s);
      } else {
        rect(x - 10, y, s, s);
        rect(x, y, s, s);
        rect(x + 10, y, s, s);
      }
    } else {
      //rect(x, y, s, s);
      if (isDoge) {
        image(doge, x, y, s, s);
      } else {
        rect(x, y, s, s);
      }
    }
  }
}