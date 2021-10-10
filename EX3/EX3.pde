float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float faceSize = 500;
float lengthSecondHand = 220;
float lengthMinuteHand = 200;
float lengthHourHand = 100;

color outlineCol = color(0);
color secondCol = color(255, 0, 0);
color faceCol = color(100, 210, 200);

void setup() {
  size(800, 600, P2D); 
  strokeWeight(2);
}

void draw() { 
  background(0);  
  
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  } 
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
      rect(0,0,width,height);

  }
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  fill(faceCol);
  noStroke();
  ellipse(width/2, height/2, faceSize, faceSize);
  
  stroke(0, 50, 20, 35);
  for(int i=0; i<12; i++) {
    float rot = ((float) i/12) * TWO_PI;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot);
    line(0, faceSize/5, 0, faceSize/2);
    popMatrix();
  }
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSeconds);
  fill(secondCol);
  noStroke();
  ellipse(0, -lengthSecondHand, 15,15);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotMinutes);
  fill(100,120,205);
  noStroke();
  ellipse(0, -lengthMinuteHand, 22,22);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotHours);
  fill(90,20,20);
  ellipse(0, -lengthHourHand, 30,30);
  popMatrix();
  
  fill(255);
  ellipse(width/2, height/2, 10, 10);
} 
