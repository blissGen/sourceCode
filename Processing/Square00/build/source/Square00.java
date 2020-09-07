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

public class Square00 extends PApplet {

Square[] squares = new Square[100];
public void setup() {
    
    //size(800, 800);
    float x = width*0.05f;
    float y = height*0.05f;
    int k = 0;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            squares[k] = new Square(x + i * width*0.1f, y + j * height*0.1f);
            k++;
        }
    }
}
public void draw() {
    background(00);
    for (int i = 0; i < squares.length; i++) {
        squares[i].display();
        squares[i].spin();
    }
    if (mousePressed == false){
      noCursor();
    }
}
class Square {
    PVector loc, vel, acc;
    float x, y, a, aVel, aAcc;

    Square(float x, float y) {
        this.x = x;
        this.y = y;
        a = 0;
        aVel = 0.0f;
        aAcc = random(-0.001f, 0.001f);
    }
    public void display() {
        rectMode(CENTER);
        noStroke();
        fill(255);
        pushMatrix();
        translate(this.x, this.y);
        rotate(a);
        rect(0, 0, 60, 60);
        popMatrix();
    }
    public void spin() {
        a += aVel;
        aVel += aAcc;
        aVel = constrain(aVel, -0.05f, 0.05f);
    }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Square00" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
