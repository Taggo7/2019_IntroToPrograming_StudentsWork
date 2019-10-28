Object Flower;  // The flower object 
Object Bee; // The Ball object

  
void setup() {
  size(1800, 1800); //Canvas

//variables
  int _rF= 160; //radius of the flower ellipses
  int _rB=100;
  float _x=width/2; //starting point for x-value
  float _y=height/2; //starting point for y-value
  int BeeColor=(#F7ED23);
  int _petals=7; //number of petals
  int _pc=#FFA000; //petals color
  int offset = 300; //en konstant der bruges til at give afstand mellem blomsterne.
  float _speedF=2;
  float _speedB=8;
  


  Flower = new Object(_rF, _petals, _x, _y, _pc, _speedF); 
  Bee = new Object(_rB, _x, _y-offset, BeeColor, _speedB);
}

void draw() {
  background(#43AF76);
   if (Flower.overlaps(Bee)){
  background (0, 0, 255);
   }

Bee.displayBee();
Bee.move();
Bee.bounce(2);
Bee.mousePressed_x();
Bee.mousePressed_y();
Flower.displayFlower();
Flower.move();  
Flower.bounce(1);
}
