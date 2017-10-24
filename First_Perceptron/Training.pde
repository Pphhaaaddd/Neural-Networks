class Point {
  float[] inputs = new float[3];
  float x,y;
  int label;

  Point() {
    inputs[0]=random(-1,1);
    inputs[1]=random(-1,1);
    inputs[2] = 1;
    
    x = map(inputs[0],-1,1,0,width);
    y = map(inputs[1],-1,1,height,0);
    
    float lineY = f(inputs[0]);
    if (inputs[1] < lineY) {
      label =1;
    } else {
      label =-1;
    }
  }

  void display() {
    stroke(0);
    rectMode(CENTER);
    if (label == 1)
      ellipse(x, y, 8, 8);
    else
      rect(x, y, 8, 8);
    
  }
  
}