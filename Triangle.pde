class Triangle{
  private int x, y, len, min, mColor, angle;
  public Triangle(int x, int y, int len, int min){
    this.x = x;
    this.y = y;
    this.len = len;
    this.min = min;
    mColor = 100;
    angle = 0;
  }
  public void show(){
    if(min < 2){
      min = 2;  
    }
    int minVal = len/(min/2);
    if(min > len){
      minVal = 3;
    }
    float radAngle = (float)((float)angle / 360 * Math.PI * 2);
    translate(x, y);
    rotate(radAngle);
    sierpinskiTriangle(0, 0, len, minVal);
    rotate(-radAngle);
    translate(-x, -y);
  }
  public void sierpinskiTriangle(int x, int y, int len, int min){
    fill(mColor);
    if(len <= min){
      triangle(x, y-len/2, x-len/2, y + len/2, x +len/2, y+len/2);
    }
    else{
      sierpinskiTriangle(x - len/4, y + len/4, len/2, min);
      sierpinskiTriangle(x, y - len/4, len/2, min);
      sierpinskiTriangle(x + len/4, y + len/4, len / 2, min);
    }
  }
  public void setX(int x){
    this.x = x;
  }
  public void setY(int y){
    this.y = y;
  }
  public void setLen(int l){
    len = l;
  }
  public void setMin(int m){
    min = m;
    while(min > len){
      min /= 2;
    }
  }
  public void setAngle(int a){
    angle = a;
    while(angle > 360){
      angle -= 360;
    }
    while(angle < 0){
      angle += 360;
    }
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public int getLen(){
    return len;
  }
  public int getMin(){
    return min;
  }
  public int getAngle(){
    return angle;  
  }
  public void setColor(int c){
    mColor = c;
  }
}
