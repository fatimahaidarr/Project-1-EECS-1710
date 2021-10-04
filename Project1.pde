PImage backgroundGif[];
int backgroundFrame;
int N = 160;
PImage pic1;
PImage pic2;
PImage fly;
PImage currentPlant;
PVector flyPos;
PVector plantPos;
float randomX; 
float randomY;

boolean attack = false;

void setup(){
  size(600,400);
  pic1 = loadImage("pic1.png");
  pic2 = loadImage("pic2.png");
  fly = loadImage("giphy.gif");
  currentPlant = pic1;
  backgroundGif = new PImage[160];
  for(int i=0;i<backgroundGif.length;i++){
    backgroundGif[i] = loadImage("Background_gif/BoldGreenDunnart-size_restricted-" + str(i) + ".png");
    backgroundGif[i].resize(600, 400);
  } //<>//
}

void draw(){
  backgroundFrame = (backgroundFrame + 1) % N;
  background(backgroundGif[backgroundFrame]);
  //closed
  pic1.resize(100,0);

  //opened
  pic2.resize(180,0);
  image(currentPlant,300 - currentPlant.width/2, 200);
  
  // plant target position
  plantPos = new PVector(300 , 200);
  
  //fly
  fly.resize(50,0);
  
  flyPos = new PVector(mouseX + random(-5,5), mouseY + random(-5,5));
 
  attack = flyPos.dist(plantPos) < 50;

  if (attack){
    currentPlant = pic2;
 }
  else { 
    currentPlant = pic1;
    image(fly, flyPos.x, flyPos.y);
  }
   
   
  //image(giphy,mouseX,mouseY);
}
