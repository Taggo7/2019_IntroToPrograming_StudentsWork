Object Flower;  // The flower object 
Object Bee; // The Bee object

  
void setup() {
  size(1800, 1800); //Canvas

//variables
  int _rF= 170; //radius of the flower ellipses
  int _rB=140; //radius of the bee
  float _x=width/2; //starting point for x-value
  float _y=height/2; //starting point for y-value
  int BeeColor=(#F7ED23);
  int _petals=7; //number of petals
  int _pc=#F5D5F3; //petals color
  int offset = 280; //Where the bee starts
  float _speedF=2; //the flowers speed
  float _speedB=8; //the bees speed
  


  Flower = new Object(_rF, _petals, _x, _y, _pc, _speedF); 
  Bee = new Object(_rB, _x, _y-offset, BeeColor, _speedB);
}

void draw() {
  background(#A4C8CE);
   if (Flower.overlaps(Bee)){
  background (#000405);
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
