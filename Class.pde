class Object {

  // Variables
  float speed; //Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
  float ballX;
  float ballY;
  

int BeeSizeX=200;
int BeeSizeY=120;
int EyeSize=15;


  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  int BeeColor; //hexadecimal number for the color of the circle

  //the name in the contructor is irrelevant. It could just as well be called _petals like in the main class. 
  //The local variables in the constructor is on the other hand very important.
  //no void and a big first letter for the constructor. Return type of constructor is itself. 
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

  void displayFlower () {
    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
  
  void displayBee(){
    fill(#F7ED23);
      strokeWeight(7);
  //Draw the bee body
  ellipse(x, y, BeeSizeX, BeeSizeY);

  //Draw the eye
  fill(0, 0, 0);
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
  fill(255,255,255);
  ellipse(x-20, y-110, 50, 100);
  ellipse(x+10, y-110, 50, 100);
  pop();
  }
    
  void move() {
    x = x + speed; //forøger x-værdien med varablen speed.
  }
  
  //jeg har indsat variablen i, så man kan justere om hvor langt fra skærmkanterne objektet skal bounce. 
  //Blomster objekterne skal fx deles med 1, da de har blade og derfor skal bounce før centercirklen rammer skærmen. 
  //Cirklen derimod skal deles med sin 2 for at bounce på kanten.
  float bounce(int i) {
    if (x > width-r/i || x < r/i || y > height || y < 0) {
      speed = speed * (-1);
    }
    return speed;
  }

  boolean overlaps(Object someOtherObject) {
    if (dist(x, y, someOtherObject.x, someOtherObject.y)<(r+someOtherObject.r))
    {
      return true;
    } 
    else
    {
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
  return y; //returns the initial x-value
}
}
