int[] x = new int[70];
int[] y = new int[70];
int firesize = 20;
int subtract = 0;
int startX = 0;
int startY = 700;
int endX = 0;
int endY = 700;
int lightcounter = 40;
int scorchedearthL = 0;
int scorchedearthR = 0;
float scorchedearthY =10;

void setup() {
  size(1100, 700);
}

void mousePressed() {
  startX = mouseX;
  startY = 700;
  for (int i = 0; i<40; i++) {
    endY = (int)(startY - (Math.random()*50));
    endX = (int)(startX -((Math.random()*50)-25));
    strokeWeight(10);
    stroke(150, 0, 150);
    line(startX, startY, endX, endY);
    strokeWeight(3);
    stroke(300, 300, 300);
    line(startX, startY, endX, endY);
    startY = endY;
    startX = endX;

    if (i%12 == 0) {
      int segstartX = endX;
      int segstartY = endY;
      int segendY = 0;
      int segendX = 0;
      int left = 1;
      if ((int)(Math.random()*2) == 0) {
        left = -1;
      }
      for (int z = 0; z<8; z++) {
        segendY = (int)(segstartY - (Math.random()*-20));
        segendX = (int)(segstartX -((Math.random()*20*left)));
        strokeWeight(10);
        stroke(150, 0, 150);
        line(segstartX, segstartY, segendX, segendY);
        strokeWeight(3);
        stroke(300, 300, 300);
        line(segstartX, segstartY, segendX, segendY);
        segstartY = segendY;
        segstartX = segendX;
      }
    }
  }
  lightcounter = 0;
  if (subtract == 0) {
    scorchedearthL = mouseX;
    scorchedearthR = mouseX;
    for (int i = 0; i<70; i++) {
      x[i] = (int)((Math.random()*70)+mouseX-35);
      y[i] = (int)((Math.random()*30)+580);
      subtract = millis()+1000;
    }
  }
}

void draw() {
  if (lightcounter<40) {
    lightcounter+=2;
    fill(0, 0, 0, 30);
    rect(-50, -50, 1200, 800);
    noStroke();
    fill(300, 300, 300);
    ellipse(900, 200, 200, 200);
    fill(0, 0, 0);
    ellipse(950, 180, 150, 180);
    fill(10, 100, 0);
    rect(0, 650, 1100, 50);
  } else {


    background(0, 0, 0);
    noStroke();
    fill(300, 300, 300);
    ellipse(900, 200, 200, 200);
    fill(0, 0, 0);
    ellipse(950, 180, 150, 180);

    fill(10, 100, 0);
    rect(0, 650, 1100, 50);
  }
  if (subtract>0 && subtract<millis()) {
    for (int i = 0; i<firesize; i++) {
      strokeWeight(2);
      stroke(300, 0, 0);
      fill(255, 100, 0);
      if (millis()-subtract<20000) {
        if (i%2 == 0) {
          x[i]+= (int)(Math.random()*2);
          if(x[i]>scorchedearthR){
            scorchedearthR = x[i];
          }
        } else {
          x[i]+= (int)(Math.random()*-2);
           if(x[i]<scorchedearthL){
            scorchedearthL = x[i];
          }
        }
      } else {
        x[i]+= (int)(Math.random()*6-3);
      }

      y[i] += (int)(Math.random()*6-3);
      int xadd = (int)(Math.random()*30+10);
      triangle(x[i], (constrain(y[i], 0, 650)), (int)(x[i]+xadd), 650, (int)(x[i]+(xadd*-1)), 650);
      fill(2555, 200, 0);
      noStroke();
      triangle(x[i], (constrain(y[i]+20, 0, 630)), (int)(x[i]+(xadd/2)), 650, (int)(x[i]+((xadd*-1)/2)), 650);
    }

    firesize = (int)(constrain((millis()-subtract)/500+20, 0, 70));
    fill(150,150,0);
    rect(scorchedearthL-30,651,scorchedearthR-scorchedearthL+60,scorchedearthY);
    scorchedearthY = constrain(scorchedearthY+.2,0,50);
  }
  
}
