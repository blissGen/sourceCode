ArrayList<DotSystem> system;
// Attractor attract;
PImage img;

void setup() {
    size(500, 500);
    system = new ArrayList<DotSystem>();
    system.add(new DotSystem(new PVector ()));
    background(255);
    // attract = new Attractor();
    img = loadImage("greenery.jpeg");
}
void draw() {
    //background(00);
    for (DotSystem ds: system) {
        PVector grav = new PVector(random(-0.2, 0.05), -0.2);
        PVector origin = new PVector();
        ds.applyForce(grav);
        // ds.applyAttractor(attract);
        ds.run();
        ds.systemStartPoint();
        ds.addDot();
        // attract.update();
        // attract.display();
    }
    saveFrame("output/greenery_######.png");
}
class DotSystem {
    ArrayList <Dot> dots;
    PVector origin;
    float a, r, n, t, x;
    DotSystem(PVector l) {
        dots = new ArrayList<Dot>();
        origin = new PVector(width*0, height*0.5);
        r = width*0.45;
        a = 0;
        t = 0;
    }
    void applyForce(PVector f) {
        for (Dot d: dots) {
            d.applyForce(f);
        }
    }
    // void applyAttractor(Attractor a) {
    //     for (Dot d: dots) {
    //         PVector attractForce = a.attract(Dot d);
    //         d.applyForce(f);
    //     }
    // }
    void systemStartPoint() {
        // origin.y = r * sin(a) + height*0.5;
        // a += x;
        // n = noise(t);
        // t += 0.04;
        // x = map(n, 0, 1, 0, 0.08);
        origin.x = random(width*-0.2, width*1);
        origin.y = random(height*-0.2, height*1);
    }
    void addDot() {
        // float r0 = random(1);
        // if (r0 < 1) {
        dots.add(new Dot(origin));
        //}
    }
    void run() {
        for (int i = dots.size() - 1; i >= 0; i--) {
            Dot d = dots.get(i);
            d.update();
            d.display();
            if (d.outOfBounds()) {
                dots.remove(i);
        }
    }
}
class Dot {
    PVector loc, vel, acc;
    float a, mass, size, dX, dY, r;
    color c;

    Dot(PVector l) {
        loc = l.get();
        vel = new PVector();
        acc = new PVector();
        mass = 25;
        r = random(0.25, 0.75);
    }
    void applyForce(PVector force) {
        PVector f = force.get();
        f.div(mass);
        acc.add(f);
    }
    void update() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(1);
        acc.mult(0);
        c = img.get(int(loc.x), int(loc.y));
        acc.x += random(random(-0.02, 0.015),random(-0.01, 0.025));
        acc.y += random(-0.02, 0.035);
        //cycle -= 0.85;
        //mass += 0.4;
    }
    void display() {
        noStroke();
        fill(c);
        ellipse(loc.x, loc.y, mass*r, mass*r);
    }
    boolean outOfBounds() {
        if ((loc.x > width*1.2 || loc.x < width*-0.2) || (loc.y > height*1.2 || loc.y < height*-0.2)) {
            return true;
            } else {
            return false;
            }
        }
    }
}
// class Attractor {
//     PVector loc, vel, acc;
//     float x, y, r, a, grav, strength, mass;
//     Attractor() {
//         loc = new PVector(width*0.5, height*0.5);
//         mass = 5;
//         strength = 40;
//         r = width*0.5;
//         a = 0;
//     }
//     PVector attract(Dot d) {
//         PVector dir = PVector.sub(loc, d.loc);
//         float d = dir.mag();
//         dir.normalize();
//         d = constrain (d, 0, 60);
//         float force = (strength * mass * d.mass) / (d * d);
//         dir.mult(force);
//         return dir;
//     }
//     void update() {
//         loc.x = r * sin(a);
//         loc.y = r * cos(a);
//         a -= random(0.01,0.02);
//     }
//     void display() {
//         stroke(255);
//         noFill();
//         ellipse(loc.x + width*0.5, loc.y + height*0.5, mass*50, mass*50);
//     }
// }
