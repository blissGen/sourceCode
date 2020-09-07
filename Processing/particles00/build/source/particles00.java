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

public class particles00 extends PApplet {

ArrayList<ParticleSystem> systems;
//ParticleSystem ps;
Attractor attract;

public void setup() {
    //fullScreen();
    
    systems = new ArrayList<ParticleSystem>();
    systems.add(new ParticleSystem(new PVector(width*0.5f, height*0)));
    //ps = new ParticleSystem();
    attract = new Attractor();
}
public void draw() {
    background(00);
    //systems.add(new ParticleSystem(new PVector(50, 50)));
    for (ParticleSystem ps: systems) {

        PVector grav = new PVector(0, -0.02f);
        ps.applyForce(grav);
        ps.applyAttractor(attract);
        ps.run();
        ps.addParticle();
        attract.update();
        attract.display();
    }
    //saveFrame("output/movment_######.png");
}
class ParticleSystem {
    ArrayList <Particle00> particles;
    PVector origin;
    ParticleSystem(PVector l) {
        particles = new ArrayList<Particle00>();
        origin = l.get();
    }
    public void applyForce(PVector f) {
        for (Particle00 p: particles) {
            p.applyForce(f);
        }
    }
    public void applyAttractor(Attractor a) {
        for (Particle00 p: particles) {
            PVector force = a.attract(p);
            p.applyForce(force);
        }
    }
    public void addParticle() {
        float r = random(1);
        if (r < 0.5f) {
            particles.add(new Particle00 (origin));
        } else {
            particles.add(new Particle01 (origin));
        }
    }
    public void run() {
        for (int i = particles.size() - 1; i >= 0; i--) {
            Particle00 p = particles.get(i);
            p.update();
            p.spin();
            p.display();
            if (p.fullCycle()) {
                particles.remove(i);
            }
        }
    }
}
class Particle00 {
    PVector loc, vel, acc;
    float a, mass, size, cycle, r, g, b;
    Particle00(PVector l) {
        loc = l.get();
        vel = new PVector();
        acc = new PVector(0.0f, 0.0f);
        mass = random(0.1f, 1.75f);
        cycle = 255;
    }
    public void applyForce(PVector force) {
        PVector f = force.get();
        f.div(mass);
        acc.add(f);
    }
    public void update() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(2);
        //loc.add(rand);
        acc.mult(0);
        cycle -= 0.3f;
        loc.x = (width*0.4f * sin(a)) + width*0.5f;
        a -= 0.02f;
    }
    public void spin() {

    }
    public void display() {
        strokeWeight(1);
        stroke(255, cycle);
        fill(00, 00);
        ellipse(loc.x, loc.y, mass*40, mass*40);
        if (mousePressed == false){
          noCursor();
        }
    }
    public boolean fullCycle() {
        if (cycle <= 0) {
            return true;
        } else {
            return false;
        }
    }
}
class Particle01 extends Particle00 {
    float x, y, a, aVel, aAcc;
    Particle01(PVector l) {
        super(l);
        //this.x = l.x;
        //this.y = l.y;
        a = 0;
        aVel = 0.0f;
        aAcc = random(-0.01f, 0.01f);
        //loc.x = this.x;
        //loc.y = this.y;
    }
    public void update() {
        super.update();
    }
    public void display() {
        rectMode(CENTER);
        strokeWeight(1);
        stroke(255, cycle);
        fill(00, 00);
        pushMatrix();
        //translate(this.x, this.y);
        //rotate(a);
        rect(loc.x, loc.y, mass*20, mass*20);
        popMatrix();
    }
    public void spin() {
        a += aVel;
        aVel += aAcc;
        aVel = constrain(aVel, -0.05f, 0.05f);
    }
}
class Attractor {
    PVector loc, vel, acc;
    float x, a, grav, strength, mass;

    Attractor() {
        loc = new PVector(width*0.5f, height*1);
        mass = 1;
        strength = 75;
    }
    public PVector attract(Particle00 p) {
        PVector dir = PVector.sub(loc, p.loc);
        float d = dir.mag();
        dir.normalize();
        d = constrain (d, 0, random(49, 55));
        float force = (strength * mass * p.mass) / (d * d);
        dir.mult(force);
        return dir;
    }
    public void update() {
        loc.x = (width*0.5f * sin(a)) + width*0.5f;
        a += 0.05f;
    }
    public void display() {
        noStroke();
        noFill();
        ellipse(loc.x, loc.y, mass*50, mass*50);
    }
}
  public void settings() {  size(720, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "particles00" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
