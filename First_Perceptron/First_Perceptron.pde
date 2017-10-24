Perceptron p;

ArrayList<Point> points;

float m = 2, c = - 100, x1 = -1, x2 = 1; //slope of line and constant
float y1 = f(x1);
float y2 = f(x2);

float f(float x) {
  return (0.1 * x + 0.5);
}


void setup() {
  size(400, 400);
  p=new Perceptron();
  points = new ArrayList<Point>();
  x1 = map(x1, -1 , 1, 0, width);
  y1 = map(y1, -1, 1, height, 0);
  x2 = map(x2, -1 , 1, 0, width);
  y2 = map(y2, -1, 1, height, 0);
}

void draw() {
  background(255);
  stroke(0);

  line(x1, y1, x2, y2);
  p.display();
  if (points.size() < 800)
    points.add(new Point());
  for (Point p1 : points) {
    p1.display();
    float[] inputs = p1.inputs;
    int target = p1.label;
    p.train(inputs, target);

    float guess = p.guess(inputs);
    if (guess == target) 
      fill(0, 255, 0);
    else
      fill(255, 0, 0);
    noStroke();
    ellipse(p1.x, p1.y, 6, 6);
  }
}

void mousePressed() {
  for (Point p1 : points) {
    int target = p1.label;
    p.train(p1.inputs, target);
  }
}