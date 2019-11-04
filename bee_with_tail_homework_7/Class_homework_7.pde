class Object {

  // Variables
  float speed; 
  float circleX;
  float circleY;
  
  int BeeSizeX=200;
  int BeeSizeY=120;
  int EyeSize=15;
  int WingX=50;
  int WingY=100;


  float r;           // radius of the flower petal
  int n_petals;      // number of petals 
  float x;           // x-position of the center of the flower
  float y;           // y-position of the center of the flower
  int petalColor;    //hexadecimal number for the color of petals
  int BeeColor;      //hexadecimal number for the color of the circle

  // constructor overloading --> when you have different parameters for creating an instance of a class
    //flower object
  Object(float _r, int _n_petals, float _x, float _y, int _petalColor, float _speed) {
    r=_r;
    n_petals = _n_petals;
    x=_x;
    y=_y;
    petalColor=_petalColor;
    speed = _speed;
  }
  
  //Bee object
  Object(float _r, float _x, float _y, int _BeeColor, float _speed){
    r=_r;
    x=_x;
    y=_y;
    speed=_speed;
    BeeColor=_BeeColor;
}
    //making the flower
  void displayFlower () {
    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      circleX=x + r*cos(i);
      circleY=y + r*sin(i);
      ellipse(circleX, circleY, r, r);
    }
    fill(#DE07C1);
    ellipse(x, y, r*1.2, r*1.2);
  }
  
      //making the bee
  void displayBee(float x, float y, float newR){
    fill(#F7ED23, newR + 200);
      strokeWeight(7);
  //Draw the bee body
  ellipse(x, y, BeeSizeX, BeeSizeY);

  //Draw the eye
  fill(0, 0, 0, newR + 200);
  ellipse(x+60, y-10, EyeSize, EyeSize);

  //bees stripes
  push();
  strokeWeight(15);
  line(x-30, y+52, x-30, y-52);
  line(x+10, y+55, x+10, y-55);
  pop();
  
  //bee wings
  push();
  strokeWeight(1);
  fill(255,255,255, newR + 200);
  ellipse(x-20, y-110, WingX, WingY);
  ellipse(x+10, y-110, WingX, WingY);
  pop();
  }
    
  void move() {
    x = x + speed;   //increase the x-value with the variable speed.
  }
  
 //object bouncing when touching the sides of the screen
  float bounce(int i) {
    if (x > width-r/i || x < r/i || y > height || y < 0) {
      speed = speed * (-1);
    }
    return speed;
  }

  boolean overlaps(Object someOtherObject) {
    if (dist(x, y, someOtherObject.x, someOtherObject.y)<(r+someOtherObject.r))
    {
      println("Overlapping: ", x, y, someOtherObject.x, someOtherObject.y);
      return true;
    } 
    else
    {
      println("NOT Overlapping: ", x, y, someOtherObject.x, someOtherObject.y);
      return false;
    }
  }
  
float mousePressed_x () {
  if (mousePressed) {
    x = mouseX;
  }
  return x; //returns the initial x-value
}

float mousePressed_y () {
  if (mousePressed) {
  y = mouseY;
}
  return y; //returns the initial y-value
}
}
