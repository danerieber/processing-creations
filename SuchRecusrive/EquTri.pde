public class EquTri implements java.lang.Cloneable {
  
  
  public float x, y;
  private float width;
  
  public EquTri(float x, float y, float width) {
    this.x = x;
    this.y = y;
    this.width = width;
  }
  
  public void draw() {
    triangle(x, y + getHeight(), x + (getWidth() / 2), y, x + getWidth(), y + getHeight());
  }
  
  public float getWidth() {
    return width;
  }
  
  public float getHeight() {
    return width * equTriHeightRatio;
  }
  
  public void setWidth(float w) {
    width = w;
  }
  
  @Override
  public EquTri clone() {
    try {
      return (EquTri)super.clone();
    } catch (CloneNotSupportedException e) {
      return null;
    }
  }
  
}