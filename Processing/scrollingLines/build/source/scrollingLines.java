import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class scrollingLines extends PApplet {

Line0[] lines0 = new Line0[20];
Line1[] lines1 = new Line1[20];
public void setup() {
    
    for (int i = 0; i < lines0.length; i++) {
        lines0[i] = new Line0();
    }
    for (int i = 0; i < lines1.length; i++) {
        lines1[i] = new Line1();
    }
}
public void draw() {
    background(00);
    for (int i = 0; i < lines0.length; i++) {
    lines0[i].display();
    lines0[i].move();
    }
    for (int i = 0; i < lines1.length; i++) {
    lines1[i].display();
    lines1[i].move();
    }
    if (mousePressed == false){
      noCursor();
    }
}
class Line0 {
    PVector dotL, dotR, vel0, vel1;

    float r0 = random(1, 1.5f);
    float r1 = random(1, 1.5f);
    boolean changeCorse0 = true;
    boolean changeCorse1 = true;
    Line0() {
        dotL = new PVector(width*0.1f, random(height*0.1f, height*0.9f));
        dotR = new PVector(width*0.9f, random(height*0.1f, height*0.9f));
        vel0 = new PVector(0, r0);
        vel1 = new PVector(0, r1);
    }
    public void display() {
        strokeWeight(1);
        stroke(255);
        line(dotL.x, dotL.y, dotR.x, dotR.y);
    }
    public void move() {
        if((dotL.y < height*0.1f) || (dotL.y > height*0.9f)) {
            changeCorse0 = !changeCorse0;
        }
        if(changeCorse0) {
            dotL = dotL.sub(vel0);
        } else if(!changeCorse0) {
            dotL = dotL.add(vel0);
        }
        if((dotR.y < height*0.1f) || (dotR.y > height*0.9f)) {
            changeCorse1 = !changeCorse1;
        }
        if(changeCorse1) {
            dotR = dotR.add(vel1);
        } else if(!changeCorse1) {
            dotR = dotR.sub(vel1);
        }
    }
}
class Line1 {
    PVector dotT, dotB, vel0, vel1;

    float r0 = random(1, 1.5f);
    float r1 = random(1, 1.5f);
    boolean changeCorse0 = true;
    boolean changeCorse1 = true;
    Line1() {
        dotT = new PVector(random(width*0.1f, width*0.9f), height*0.1f);
        dotB = new PVector(random(width*0.1f, width*0.9f), height*0.9f);
        vel0 = new PVector(r0, 0);
        vel1 = new PVector(r1, 0);
    }
    public void display() {
        strokeWeight(1);
        stroke(255);
        line(dotT.x, dotT.y, dotB.x, dotB.y);
    }
    public void move() {
        if((dotT.x < width*0.1f) || (dotT.x > width*0.9f)) {
            changeCorse0 = !changeCorse0;
        }
        if(changeCorse0) {
            dotT = dotT.sub(vel0);
        } else if(!changeCorse0) {
            dotT = dotT.add(vel0);
        }
        if((dotB.x < width*0.1f) || (dotB.x > width*0.9f)) {
            changeCorse1 = !changeCorse1;
        }
        if(changeCorse1) {
            dotB = dotB.add(vel1);
        } else if(!changeCorse1) {
            dotB = dotB.sub(vel1);
        }
    }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "scrollingLines" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
