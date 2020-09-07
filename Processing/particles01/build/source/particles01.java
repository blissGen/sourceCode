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

public class particles01 extends PApplet {

ArrayList<ParticleSystem> systems;

public void setup() {
    //fullScreen();
    
    systems = new ArrayList<ParticleSystem>();
    systems.add(new ParticleSystem(new PVector (width*0.5f, height*0.5f)));
}
public void draw() {
    background(00);
    for (ParticleSystem ps: systems) {
        PVector grav = new PVector(15, 0);
        PVector origin = new PVector(width*0.5f, height*0.5f);
        ps.applyForce(grav);
        ps.run();
        ps.particleMove();
        ps.addParticle();
    }
    //saveFrame("output/movment_######.png");
}
class ParticleSystem {
    ArrayList <Particle00> particles;
    PVector origin;
    float a, r, n, t, x;
    ParticleSystem(PVector l) {
        particles = new ArrayList<Particle00>();
        origin = new PVector(width*0.1f, height*0.5f);
        r = width*0.15f;
        a = 0;
        t = 0;
    }
    public void applyForce(PVector f) {
        for (Particle00 p: particles) {
            p.applyForce(f);
        }
    }
    public void particleMove() {
        origin.y = r * sin(a) + height*0.5f;
        a += x;
        n = noise(t);
        t += 0.01f;
        x = map(n, 0, 1, 0, 0.08f);
    }
    public void addParticle() {
        float r0 = random(1);
        if (r0 < 1) {
            particles.add(new Particle00 (origin));
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
        mass = 1;
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
        acc.mult(0);
        cycle -= 0.85f;
        mass += 0.4f;
    }
    public void display() {
        strokeWeight(1);
        stroke(255, cycle);
        fill(00, 00);
        ellipse(loc.x, loc.y, mass, mass);
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
  public void settings() {  size(1080, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "particles01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
