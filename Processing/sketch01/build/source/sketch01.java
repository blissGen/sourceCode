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

public class sketch01 extends PApplet {

Dot0[] dots0 = new Dot0[300];
Dot1[] dots1 = new Dot1[300];

public void setup() {
    
    for (int i = 0; i < dots0.length; i++) {
        dots0[i] = new Dot0();
    }
    for (int  i = 0; i < dots1.length; i++) {
        dots1[i] = new Dot1();
    }
}
public void draw() {
    background(00);

    for (int i = 0; i < dots0.length; i++) {
    dots0[i].display();
    dots0[i].movment();
    dots0[i].end();
    }
    for (int i = 0; i < dots1.length; i++) {
    dots1[i].display();
    dots1[i].movment();
    dots1[i].end();
    }
    if (mousePressed == false){
      noCursor();
    }
}

class Dot0 {
    float x;
    float y;

    float roy;
    float biv;
    float gee;

    float move = 3;
    Dot0() {
        x = width*0.1f;
        y = random(height*0.1f, height*0.9f);

        roy = random(255);
        biv = random(255);
        gee = random(255);
    }
    public void display() {
        noStroke();
        ellipse(x, y, 20, 20);
        fill(roy, biv, gee);
    }
    public void movment() {
        x = x + move;
        y = y - move;
    }
    public void end() {
        if (y < height*0.1f) {
            x = width*0.1f;
            y = random(height*0.1f, height*0.9f);
        }
    }
}
class Dot1 {
    float x;
    float y;

    float roy;
    float biv;
    float gee;

    float move = 3;
    Dot1() {
        x = width*0.9f;
        y = random(height*0.1f, height*0.9f);

        roy = random(255);
        biv = random(255);
        gee = random(255);
    }
    public void display() {
        noStroke();
        ellipse(x, y, 20, 20);
        fill(roy, biv, gee);
    }
    public void movment() {
        x = x - move;
        y = y + move;
    }
    public void end() {
        if (y > height*0.9f) {
            x = width*0.9f;
            y = random(height*0.1f, height*0.9f);
        }
    }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
