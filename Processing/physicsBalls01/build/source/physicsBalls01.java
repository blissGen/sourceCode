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

public class physicsBalls01 extends PApplet {

Anchor a;

PhysBall[] balls = new PhysBall[1000];
public void setup() {
    //fullScreen();
    
    a = new Anchor();
    for (int i = 0; i < balls.length; i++ ) {
        balls[i] = new PhysBall();
    }
}
public void draw() {
    background(00);
    PVector f0 = new PVector(random(-0.05f, 0.2f), random(-0.005f, 0));
    //PVector fric;


    for (int i = 0; i < balls.length; i++) {
        balls[i].applyForce(f0);

        PVector force = a.attract(balls[i]);
        balls[i].applyForce(force);
        //friction
        PVector fric = balls[i].vel.get();
        fric.normalize();
        fric.mult(-1);

        float fricCo = random(-0.001f, 0.006f);
        fric.mult(fricCo);

        balls[i].applyForce(fric);
        //

        balls[i].display();
        balls[i].movement();
        //balls[i].ballControl();
        balls[i].boundry();
        if (mousePressed == false){
          noCursor();
        }
    }
    saveFrame("output/movment_######.png");
}

class PhysBall {
    PVector loc, center, vel, acc, rand;
    float mass = random(0.25f, 1.25f);
    PhysBall() {
        loc = new PVector(random(width*0.1f, width*0.9f), random(height*0.1f, height*0.9f));
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        rand = new PVector(random(-0.35f,0.35f), random(-0.35f,0.35f));
    }
    public void applyForce(PVector force) {
        PVector f = PVector.div(force, mass);
        acc.add(f);
    }
    public void display() {
        noStroke();
        fill(255, 190);
        ellipse(loc.x, loc.y, mass*5, mass*5);
    }
    public void movement() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(2);
        //loc.add(rand);
        acc.mult(0);
    }
    //void apllyForce(PVector force) {
    //    acc = force;
    //}
    public void ballControl()  {
        center = new PVector(random(width*0.3f, width*0.7f), random(height*0.3f, height*0.7f));
        center.sub(loc);
        center.setMag(0.085f);
        acc = center;
    }
    public void boundry() {
        if (loc.x > width*0.9f) loc.x = width*0.1f;
        if (loc.x < width*0.1f) loc.x = width*0.9f;
        if (loc.y > height*0.9f) loc.y = height*0.1f;
        if (loc.y < height*0.1f) loc.y = height*0.9f;
    }
}

class Anchor {
    PVector loc;
    float mass, grav;

    Anchor() {
        loc = new PVector(width*0.1f, height*0.1f);
        mass = 3.0f;
        grav = 1;
    }
    public PVector attract (PhysBall balls) {
        PVector force = PVector.sub(loc, balls.loc);
        float d = force.mag();
        d = constrain(d,5, 6);
        force.normalize();
        float strength = (grav * mass * balls.mass) / (d * d);
        force.mult(strength);

        return force;
    }
    public void display() {
        noStroke();
        noFill();
        ellipse(loc.x, loc.y, mass*15, mass*15);
    }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "physicsBalls01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
