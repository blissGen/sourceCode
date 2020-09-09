Anchor a;

PhysBall[] balls = new PhysBall[1000];
void setup() {
    //fullScreen();
    size(800, 800);
    a = new Anchor();
    for (int i = 0; i < balls.length; i++ ) {
        balls[i] = new PhysBall();
    }
}
void draw() {
    background(00);
    PVector f0 = new PVector(random(-0.05, 0.2), random(-0.005, 0));
    //PVector fric;


    for (int i = 0; i < balls.length; i++) {
        balls[i].applyForce(f0);

        PVector force = a.attract(balls[i]);
        balls[i].applyForce(force);
        //friction
        PVector fric = balls[i].vel.get();
        fric.normalize();
        fric.mult(-1);

        float fricCo = random(-0.001, 0.006);
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
    float mass = random(0.25, 1.25);
    PhysBall() {
        loc = new PVector(random(width*0.1, width*0.9), random(height*0.1, height*0.9));
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        rand = new PVector(random(-0.35,0.35), random(-0.35,0.35));
    }
    void applyForce(PVector force) {
        PVector f = PVector.div(force, mass);
        acc.add(f);
    }
    void display() {
        noStroke();
        fill(255, 190);
        ellipse(loc.x, loc.y, mass*5, mass*5);
    }
    void movement() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(2);
        //loc.add(rand);
        acc.mult(0);
    }
    //void apllyForce(PVector force) {
    //    acc = force;
    //}
    void ballControl()  {
        center = new PVector(random(width*0.3, width*0.7), random(height*0.3, height*0.7));
        center.sub(loc);
        center.setMag(0.085);
        acc = center;
    }
    void boundry() {
        if (loc.x > width*0.9) loc.x = width*0.1;
        if (loc.x < width*0.1) loc.x = width*0.9;
        if (loc.y > height*0.9) loc.y = height*0.1;
        if (loc.y < height*0.1) loc.y = height*0.9;
    }
}

class Anchor {
    PVector loc;
    float mass, grav;

    Anchor() {
        loc = new PVector(width*0.1, height*0.1);
        mass = 3.0;
        grav = 1;
    }
    PVector attract (PhysBall balls) {
        PVector force = PVector.sub(loc, balls.loc);
        float d = force.mag();
        d = constrain(d,5, 6);
        force.normalize();
        float strength = (grav * mass * balls.mass) / (d * d);
        force.mult(strength);

        return force;
    }
    void display() {
        noStroke();
        noFill();
        ellipse(loc.x, loc.y, mass*15, mass*15);
    }
}
