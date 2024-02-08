Triangle tr;
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
  tr = new Triangle(400, 400, 400, 1);
  triangles.add(tr);
  triangles.add(new Triangle(600, 400, 200, 2));
}
void draw(){
  background(200);
  tr.setColor(tColor);
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
    tr.setLen(tr.getLen() + 20);
  }
  if(scaleDown.checkClick()){
    tr.setLen(tr.getLen() - 20);
  }
  if(addTriangles.checkClick()){
    tr.setMin(tr.getMin() * 2);
  }
  if(removeTriangles.checkClick()){
    tr.setMin(tr.getMin() / 2);
  }
  if(rotateCW.checkClick()){
    tr.setAngle(tr.getAngle() + 15);
  }
  if(rotateCCW.checkClick()){
    tr.setAngle(tr.getAngle() - 15);
  }
  if(addTriangle.checkClick()){
    tr.setColor(100);
    tr = new Triangle(400, 400, 400, 1);
    tNum = triangles.size();
    triangles.add(tr);
  }
  if(removeTriangle.checkClick()){
    if(triangles.size() > 1){
      triangles.remove(tr);
      tNum = 0;
      tr = triangles.get(tNum);
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
    tr.setY(tr.getY() - 20);
  }
  if(key == 's'){
    tr.setY(tr.getY() + 20);
  }
  if(key == 'd'){
    tr.setX(tr.getX() + 20);
  }
  if(key == 'a'){
    tr.setX(tr.getX() - 20);
  }
  if(keyCode == UP){
    tr.setColor(100);
    if(tr != triangles.get(triangles.size() -1)){
      tNum++;
      tr = triangles.get(tNum);
    }
    else{
      tNum = 0;
      tr = triangles.get(tNum);
    }
  }
  if(keyCode == DOWN){
    tr.setColor(100);
    if(tr != triangles.get(0)){
      tNum--;
      tr = triangles.get(tNum);
    }
    else{
      tNum = triangles.size() - 1;
      tr = triangles.get(tNum);
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
