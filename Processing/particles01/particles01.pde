ArrayList<ParticleSystem> systems;

void setup() {
    //fullScreen();
    size(1080, 720);
    systems = new ArrayList<ParticleSystem>();
    systems.add(new ParticleSystem(new PVector (width*0.5, height*0.5)));
}
void draw() {
    background(00);
    for (ParticleSystem ps: systems) {
        PVector grav = new PVector(15, 0);
        PVector origin = new PVector(width*0.5, height*0.5);
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
        origin = new PVector(width*0.1, height*0.5);
        r = width*0.15;
        a = 0;
        t = 0;
    }
    void applyForce(PVector f) {
        for (Particle00 p: particles) {
            p.applyForce(f);
        }
    }
    void particleMove() {
        origin.y = r * sin(a) + height*0.5;
        a += x;
        n = noise(t);
        t += 0.01;
        x = map(n, 0, 1, 0, 0.08);
    }
    void addParticle() {
        float r0 = random(1);
        if (r0 < 1) {
            particles.add(new Particle00 (origin));
        }
    }
    void run() {
        for (int i = particles.size() - 1; i >= 0; i--) {
            Particle00 p = particles.get(i);
            p.update();
            //p.spin();
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
        mass = 1;
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
        acc.mult(0);
        cycle -= 0.85;
        mass += 0.4;
    }
    void display() {
        strokeWeight(1);
        stroke(255, cycle);
        fill(00, 00);
        ellipse(loc.x, loc.y, mass, mass);
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
