void setup(){
  size(800, 800);
  sierpinskiTriangle(400, 400, 800, 5);
}
void sierpinskiTriangle(int x, int y, int len, int min){
  fill(0);
  if(len < min){
    triangle(x, y-len/2, x - len/2, y + len/2, x+len/2, y+len/2);
  }
  else{
    sierpinskiTriangle(x - len/4, y + len/4, len/2, min);
    sierpinskiTriangle(x, y - len/4, len/2, min);
    sierpinskiTriangle(x + len/4, y + len/4, len / 2, min);
  }
}
