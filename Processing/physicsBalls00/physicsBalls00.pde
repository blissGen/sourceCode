PhysBall[] balls = new PhysBall[8000];
void setup() {
    //fullScreen();
    size(800, 800);
    for (int i = 0; i < balls.length; i++ ) {
        balls[i] = new PhysBall();
    }
}
void draw() {
    background(00);

    PVector f0 = new PVector(0, -0.1);
    PVector f1 = new PVector(0, 0.1);
    PVector f2 = new PVector(-0.1, 0);
    PVector f3 = new PVector(0.1, 0);
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
        loc = new PVector(random(width*0.2, width*0.8), random(height*0.2, height*0.8));
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        rand = new PVector(random(-0.25, 0.25), random(-0.25, 0.25));
    }
    void display() {
        noStroke();
        fill(225);
        ellipse(loc.x, loc.y, 1, 1);
    }
    void ballControl()  {
        directorPoint = new PVector(width*0.5, height*0.5);
        directorPoint.sub(loc);
        directorPoint.setMag(0.08);
        acc = directorPoint;
    }
    void applyForce(PVector force) {
        acc.add(force);
    }
    void update() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(4);
        //loc.add(rand);
        acc.mult(0);

    }
    void boundry() {
        if (loc.x > width*0.9) loc.x = width*0.1;
        if (loc.x < width*0.1) loc.x = width*0.9;
        if (loc.y > height*0.9) loc.y = height*0.1;
        if (loc.y < height*0.1) loc.y = height*0.9;
    }
    void ballsRefresh() {
        loc = new PVector(random(width*0.2, width*0.8), random(height*0.2, height*0.8));
    }
}
