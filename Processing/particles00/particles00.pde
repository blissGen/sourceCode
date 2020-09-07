ArrayList<ParticleSystem> systems;
//ParticleSystem ps;
Attractor attract;

void setup() {
    //fullScreen();
    size(720, 720);
    systems = new ArrayList<ParticleSystem>();
    systems.add(new ParticleSystem(new PVector(width*0.5, height*0)));
    //ps = new ParticleSystem();
    attract = new Attractor();
}
void draw() {
    background(00);
    //systems.add(new ParticleSystem(new PVector(50, 50)));
    for (ParticleSystem ps: systems) {

        PVector grav = new PVector(0, -0.02);
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
    void applyForce(PVector f) {
        for (Particle00 p: particles) {
            p.applyForce(f);
        }
    }
    void applyAttractor(Attractor a) {
        for (Particle00 p: particles) {
            PVector force = a.attract(p);
            p.applyForce(force);
        }
    }
    void addParticle() {
        float r = random(1);
        if (r < 0.5) {
            particles.add(new Particle00 (origin));
        } else {
            particles.add(new Particle01 (origin));
        }
    }
    void run() {
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
        acc = new PVector(0.0, 0.0);
        mass = random(0.1, 1.75);
        cycle = 255;
    }
    void applyForce(PVector force) {
        PVector f = force.get();
        f.div(mass);
        acc.add(f);
    }
    void update() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(2);
        //loc.add(rand);
        acc.mult(0);
        cycle -= 0.3;
        loc.x = (width*0.4 * sin(a)) + width*0.5;
        a -= 0.02;
    }
    void spin() {

    }
    void display() {
        strokeWeight(1);
        stroke(255, cycle);
        fill(00, 00);
        ellipse(loc.x, loc.y, mass*40, mass*40);
        if (mousePressed == false){
          noCursor();
        }
    }
    boolean fullCycle() {
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
        aVel = 0.0;
        aAcc = random(-0.01, 0.01);
        //loc.x = this.x;
        //loc.y = this.y;
    }
    void update() {
        super.update();
    }
    void display() {
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
    void spin() {
        a += aVel;
        aVel += aAcc;
        aVel = constrain(aVel, -0.05, 0.05);
    }
}
class Attractor {
    PVector loc, vel, acc;
    float x, a, grav, strength, mass;

    Attractor() {
        loc = new PVector(width*0.5, height*1);
        mass = 1;
        strength = 75;
    }
    PVector attract(Particle00 p) {
        PVector dir = PVector.sub(loc, p.loc);
        float d = dir.mag();
        dir.normalize();
        d = constrain (d, 0, random(49, 55));
        float force = (strength * mass * p.mass) / (d * d);
        dir.mult(force);
        return dir;
    }
    void update() {
        loc.x = (width*0.5 * sin(a)) + width*0.5;
        a += 0.05;
    }
    void display() {
        noStroke();
        noFill();
        ellipse(loc.x, loc.y, mass*50, mass*50);
    }
}
