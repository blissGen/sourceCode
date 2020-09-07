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

public class physicsBalls00 extends PApplet {

PhysBall[] balls = new PhysBall[8000];
public void setup() {
    //fullScreen();
    
    for (int i = 0; i < balls.length; i++ ) {
        balls[i] = new PhysBall();
    }
}
public void draw() {
    background(00);

    PVector f0 = new PVector(0, -0.1f);
    PVector f1 = new PVector(0, 0.1f);
    PVector f2 = new PVector(-0.1f, 0);
    PVector f3 = new PVector(0.1f, 0);
    PVector f4 = new PVector(0, 0);

    for (int i = 0; i < balls.length; i++) {

        if (keyPressed)
            if (key == 'w') {
                balls[i].applyForce(f0);
        } else {
            balls[i].applyForce(f4);
        }
        if (keyPressed)
            if (key == 's') {
                balls[i].applyForce(f1);
        } else {
            balls[i].applyForce(f4);
        }
        if (keyPressed)
            if (key == 'a') {
                balls[i].applyForce(f2);
        } else {
            balls[i].applyForce(f4);
        }
        if (keyPressed)
            if (key == 'd') {
                balls[i].applyForce(f3);
        } else {
            balls[i].applyForce(f4);
        }
        if (keyPressed) {
            if (key == 'x') {
            balls[i].applyForce(f4);
            balls[i].ballsRefresh();
            //balls[i].update();
            balls[i].display();
            balls[i].ballControl();
            balls[i].boundry();
            }
        }
        balls[i].update();
        balls[i].display();
        balls[i].ballControl();
        balls[i].boundry();

    }
    if (mousePressed == false){
         noCursor();
    }
}

class PhysBall {
    PVector loc, directorPoint, vel, acc, rand;
    PhysBall() {
        loc = new PVector(random(width*0.2f, width*0.8f), random(height*0.2f, height*0.8f));
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        rand = new PVector(random(-0.25f, 0.25f), random(-0.25f, 0.25f));
    }
    public void display() {
        noStroke();
        fill(225);
        ellipse(loc.x, loc.y, 1, 1);
    }
    public void ballControl()  {
        directorPoint = new PVector(width*0.5f, height*0.5f);
        directorPoint.sub(loc);
        directorPoint.setMag(0.08f);
        acc = directorPoint;
    }
    public void applyForce(PVector force) {
        acc.add(force);
    }
    public void update() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(4);
        //loc.add(rand);
        acc.mult(0);

    }
    public void boundry() {
        if (loc.x > width*0.9f) loc.x = width*0.1f;
        if (loc.x < width*0.1f) loc.x = width*0.9f;
        if (loc.y > height*0.9f) loc.y = height*0.1f;
        if (loc.y < height*0.1f) loc.y = height*0.9f;
    }
    public void ballsRefresh() {
        loc = new PVector(random(width*0.2f, width*0.8f), random(height*0.2f, height*0.8f));
    }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "physicsBalls00" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
