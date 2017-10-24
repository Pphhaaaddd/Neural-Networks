class Perceptron {
  float[] weights = new float[3];
  float lr = 0.0001;

  Perceptron() {
    for (int i=0; i<weights.length; i++)
      weights[i] = random(-1, 1);
  }

  float guess(float[] inputs) {
    float sum =0.0;
    for (int i=0; i<weights.length; i++)
      sum += inputs[i]*weights[i];
    return sign(sum);
  }

  void train(float[] inputs, int target) {
    float guess = guess(inputs);
    float error = target - guess;

    //Tune all the wights
    for (int i=0; i<weights.length; i++) 
      weights[i] += error * inputs[i] * lr;
  }

  void display() {
    stroke(0, 0, 255);
    float mP = weights[0]/weights[1];
    float cP = weights[2]/weights[1];
    float x1 = 1, x2 = -1;
    float y1 = mP*x1 + cP;
    float y2 = mP*x2 + cP;

    x1 = map(x1, -1, 1, 0, width);
    y1 = map(y1, -1, 1, 0, height);
    x2 = map(x2, -1, 1, 0, width);
    y2 = map(y2, -1, 1, 0, height);
    line(x1, y1, x2, y2);

    println(weights[0], weights[1], weights[2]);
  }
}

//Activation function
float sign(float n) {
  if (n>=0)
    return 1.0;
  return -1.0;
}