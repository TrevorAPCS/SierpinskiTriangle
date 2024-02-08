Triangle triangle;
Button scaleUp;
Button scaleDown;
Button addTriangles;
Button removeTriangles;
Button rotateCW;
Button rotateCCW;
Button addTriangle;
Button removeTriangle;
int tNum = 0;
int tColor = 50;
ArrayList<Triangle> triangles = new ArrayList<Triangle>();

void setup(){
  size(1000, 800);
  scaleUp = new Button(810, 10, 180, 80, "Scale Up");
  scaleDown = new Button(810, 110, 180, 80, "Scale Down");
  addTriangles = new Button(810, 210, 180, 80, "Add Recursive Call");
  removeTriangles = new Button(810, 310, 180, 80, "Remove Recursive Call");
  rotateCW = new Button(810, 410, 180, 80, "Rotate CW");
  rotateCCW = new Button(810, 510, 180, 80, "Rotate CCW");
  addTriangle = new Button(810, 610, 180, 80, "Add Triangle");
  removeTriangle = new Button(810, 710, 180, 80, "Remove Triangle");
  triangle = new Triangle(400, 400, 400, 1);
  triangles.add(triangle);
  triangles.add(new Triangle(600, 400, 200, 2));
}
void draw(){
  background(200);
  triangle.setColor(tColor);
  showTriangles();
  fill(50);
  rect(800, 0, 200, 800);
  showButtons();
}
void mousePressed(){
  manageButtons();
}
void manageButtons(){
  if(scaleUp.checkClick()){
    triangle.setLen(triangle.getLen() + 20);
  }
  if(scaleDown.checkClick()){
    triangle.setLen(triangle.getLen() - 20);
  }
  if(addTriangles.checkClick()){
    triangle.setMin(triangle.getMin() * 2);
  }
  if(removeTriangles.checkClick()){
    triangle.setMin(triangle.getMin() / 2);
  }
  if(rotateCW.checkClick()){
    triangle.setAngle(triangle.getAngle() + 15);
  }
  if(rotateCCW.checkClick()){
    triangle.setAngle(triangle.getAngle() - 15);
  }
  if(addTriangle.checkClick()){
    triangle.setColor(100);
    triangle = new Triangle(400, 400, 400, 1);
    tNum = triangles.size();
    triangles.add(triangle);
  }
  if(removeTriangle.checkClick()){
    if(triangles.size() > 1){
      triangles.remove(triangle);
      tNum = 0;
      triangle = triangles.get(tNum);
    }
  }
}
void showButtons(){
  scaleUp.show();
  scaleDown.show();
  addTriangles.show();
  removeTriangles.show();
  rotateCW.show();
  rotateCCW.show();
  addTriangle.show();
  removeTriangle.show();
}
void keyPressed(){
  if(key == 'w'){
    triangle.setY(triangle.getY() - 20);
  }
  if(key == 's'){
    triangle.setY(triangle.getY() + 20);
  }
  if(key == 'd'){
    triangle.setX(triangle.getX() + 20);
  }
  if(key == 'a'){
    triangle.setX(triangle.getX() - 20);
  }
  if(keyCode == UP){
    triangle.setColor(100);
    if(triangle != triangles.get(triangles.size() -1)){
      tNum++;
      triangle = triangles.get(tNum);
    }
    else{
      tNum = 0;
      triangle = triangles.get(tNum);
    }
  }
  if(keyCode == DOWN){
    triangle.setColor(100);
    if(triangle != triangles.get(0)){
      tNum--;
      triangle = triangles.get(tNum);
    }
    else{
      tNum = triangles.size() - 1;
      triangle = triangles.get(tNum);
    }
  }
}
void showTriangles(){
  if(triangles.size() != 0){
    for(int i = 0; i < triangles.size(); i++){
      triangles.get(i).show();
    }
  }
}
