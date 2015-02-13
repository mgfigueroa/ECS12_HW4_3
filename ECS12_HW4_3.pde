void setup()
{
  size(800, 800);
  noLoop();
}

void draw()
{

  background(255);   
  strokeWeight(5);
  for(int y = 0; y<=625; y+=125) {
    float iter = y / 125;
    float cow = y/6;
    for(int i = 0; i <= 5; i++){
      float x = 125-cow+(i*(375+cow*2))/5; //for perspective
      pushMatrix();
      float ratio = .75 + .14 * y/125; //For size of cows, smaller in back, bigger in front
      translate(random(60,122)+x, random(60,122)+y-100+(120/iter) ); //translates the cows from 0,0 where they're made
      drawAnimal(ratio); //draw animal with argument that affects size
      popMatrix();
    }
  }
  noLoop();
}

void drawAnimal(float ratio) {
  float body_x = random(68, 82); //Varies body length
  float body_y = random(43, 57); //Varies body width
  float eyes = random(-2,2); //Changes direction of eyes
  
  float direction = random(-3, 1);//Higher chance to face forward than backward (negative is forward)
  float head_x = 0;//To adjust head if backward
  float tail_x = 0;//To adjust tail if backward
  float spot_x = 1;//To adjust spot if backward
  if(direction >= 0){//if facing backward, initialize values
    spot_x = -1;
    tail_x = -body_x+12;
    head_x = body_x-18;
  }
  
//The following picks a random color from the array
  color[] c = { color(74,32,32), color(70,70,70), color(0,0,0), color(95,25,0), color(84,40,25) };
  int index = (floor(random(0, 5)));
  color col = c[index];
  
  //REAR LEFT LEG
  ellipse(-22*ratio, 18*ratio, 17*ratio, 30*ratio);
  
  //REAR RIGHT LEG
  ellipse(7*ratio, 15*ratio, 17*ratio, 30*ratio);
  
  //ONLY BACKWARDS FACING
  if(direction >= 0){
  
  //BACKWARD EARS
  strokeWeight(2);
  ellipse((-3+head_x)*ratio, -22*ratio, 15*ratio, 8*ratio);
  ellipse((-47+head_x)*ratio, -22*ratio, 15*ratio, 8*ratio); 
  strokeWeight(5);
  
  //BACKWARD HEAD
  ellipse((-25+head_x)*ratio, -10*ratio, 35*ratio, 48*ratio);
  }//END BACKWARDS FACING
 
  //TAIL
  if(direction < 0){
  ellipse(36*ratio, 7*ratio, 2*ratio, 22*ratio);
  }
  //BODY
  ellipse(0, 0, body_x*ratio, body_y*ratio);
 
  //NEAR LEFT LEG
  ellipse(-7*ratio, 20*ratio, 17*ratio, 30*ratio);
  
  //NEAR RIGHT LEG
  ellipse(23*ratio, 17*ratio, 17*ratio, 30*ratio);
  
  //WHITE ELLIPSE TO REMOVE LEG LINES
  stroke(255);
  ellipse(0, 0, (body_x - 10)*ratio, (body_y - 10)*ratio);
  stroke(0);
  
  //SPOTS
  fill(col);
  stroke(col);
  ellipse( spot_x*random(3, 13)*ratio, random(-10, 5)*ratio, random(12, 20)*ratio, random(12, 20)*ratio );
  fill(255);
  stroke(0);
  
  //HEAD
  if(direction < 0){
  ellipse(-25*ratio, -10*ratio, 35*ratio, 48*ratio);
  }
  
  //ONLY ON FRONT FACING
  //NOSE
  if(direction < 0){
  fill(#FF9999);
  ellipse(-25*ratio, 0, 40*ratio, 23*ratio);
  fill(255);
  //NOSE HOLES
  stroke(#6B4040);
  fill(0);
  ellipse(-17*ratio, 0, 7*ratio, 4*ratio);
  ellipse(-33*ratio, 0, 7*ratio, 4*ratio);  
  stroke(0);
  fill(255);
  //EYES
  strokeWeight(2);
  ellipse(-32*ratio, -20*ratio, 8*ratio, 5*ratio);
  ellipse(-19*ratio, -20*ratio, 8*ratio, 5*ratio);
  fill(0);
  ellipse((-32+eyes)*ratio, -20*ratio, 1*ratio, 1*ratio);
  ellipse((-19+eyes)*ratio, -20*ratio, 1*ratio, 1*ratio);
  fill(255);
  //EARS
  ellipse(-3*ratio, -22*ratio, 15*ratio, 8*ratio);
  ellipse(-47*ratio, -22*ratio, 15*ratio, 8*ratio); 
  strokeWeight(5);
  }//END FRONT FACING
  
  //BACKWARDS TAIL
  if(direction >= 0){
  ellipse((36+tail_x)*ratio, 7*ratio, 2*ratio, 28*ratio);
  }
}

