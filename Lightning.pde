int[] x = new int[70];
int[] y = new int[70];
int firesize = 20;
int subtract = 0;
int startX = 0;
int startY = 700;
int endX = 0;
int endY = 700;
int lightcounter = 40;


void setup(){
  size(1100,700);

}

void mousePressed(){
  startX = mouseX;
startY = 700;
  for(int i = 0; i<40; i++){
    endY = (int)(startY - (Math.random()*50));
    endX = (int)(startX -((Math.random()*50)-25));
    strokeWeight(10);
    stroke(150,0,150);
    line(startX,startY,endX,endY);
    strokeWeight(3);
    stroke(300,300,300);
    line(startX,startY,endX,endY);
    startY = endY;
    startX = endX;
  }
  lightcounter = 0;
  
  for(int i = 0; i<70; i++){
  x[i] = (int)((Math.random()*70)+mouseX-35);
  y[i] = (int)((Math.random()*30)+550);
  subtract = millis();
}
}

void draw(){
  if(lightcounter<40){
    lightcounter+=2;
    fill(0,0,0,30);
  rect(-50,-50,1200,800);
  noStroke();
  fill(300,300,300);
  ellipse(900,200,200,200);
  fill(0,0,0);
  ellipse(950,180,150,180);
  fill(10,100,0);
  rect(0,650,1100,50);
  }else{
  
  
  background(0,0,0);
  noStroke();
  fill(300,300,300);
  ellipse(900,200,200,200);
  fill(0,0,0);
  ellipse(950,180,150,180);
  
  fill(10,100,0);
  rect(0,650,1100,50);
  if(subtract>0){
  for(int i = 0; i<firesize;i++){
    strokeWeight(10);
    stroke(255,50,0);
    fill(255,200,0);
    if(millis()<20000){
    if(i%2 == 0){
      x[i]+= (int)(Math.random()*2);
    }else{
          x[i]+= (int)(Math.random()*-2);
    }
    }else{
      x[i]+= (int)(Math.random()*6-3);
    }
    
    
    y[i] += (int)(Math.random()*6-3);
    triangle(x[i],(constrain(y[i],0,650)),(int)(x[i]+(Math.random()*30)),650,(int)(x[i]+(Math.random()*-30)),650);
    
  }
 
  firesize = (int)(constrain((millis()-subtract)/500+20,0,70));
  }
  
  }
}
