Line0[] lines0 = new Line0[20];
Line1[] lines1 = new Line1[20];
void setup() {
    fullScreen();
    for (int i = 0; i < lines0.length; i++) {
        lines0[i] = new Line0();
    }
    for (int i = 0; i < lines1.length; i++) {
        lines1[i] = new Line1();
    }
}
void draw() {
    background(00);
    for (int i = 0; i < lines0.length; i++) {
    lines0[i].display();
    lines0[i].move();
    }
    for (int i = 0; i < lines1.length; i++) {
    lines1[i].display();
    lines1[i].move();
    }
    if (mousePressed == false){
      noCursor();
    }
}
class Line0 {
    PVector dotL, dotR, vel0, vel1;

    float r0 = random(1, 1.5);
    float r1 = random(1, 1.5);
    boolean changeCorse0 = true;
    boolean changeCorse1 = true;
    Line0() {
        dotL = new PVector(width*0.1, random(height*0.1, height*0.9));
        dotR = new PVector(width*0.9, random(height*0.1, height*0.9));
        vel0 = new PVector(0, r0);
        vel1 = new PVector(0, r1);
    }
    void display() {
        strokeWeight(1);
        stroke(255);
        line(dotL.x, dotL.y, dotR.x, dotR.y);
    }
    void move() {
        if((dotL.y < height*0.1) || (dotL.y > height*0.9)) {
            changeCorse0 = !changeCorse0;
        }
        if(changeCorse0) {
            dotL = dotL.sub(vel0);
        } else if(!changeCorse0) {
            dotL = dotL.add(vel0);
        }
        if((dotR.y < height*0.1) || (dotR.y > height*0.9)) {
            changeCorse1 = !changeCorse1;
        }
        if(changeCorse1) {
            dotR = dotR.add(vel1);
        } else if(!changeCorse1) {
            dotR = dotR.sub(vel1);
        }
    }
}
class Line1 {
    PVector dotT, dotB, vel0, vel1;

    float r0 = random(1, 1.5);
    float r1 = random(1, 1.5);
    boolean changeCorse0 = true;
    boolean changeCorse1 = true;
    Line1() {
        dotT = new PVector(random(width*0.1, width*0.9), height*0.1);
        dotB = new PVector(random(width*0.1, width*0.9), height*0.9);
        vel0 = new PVector(r0, 0);
        vel1 = new PVector(r1, 0);
    }
    void display() {
        strokeWeight(1);
        stroke(255);
        line(dotT.x, dotT.y, dotB.x, dotB.y);
    }
    void move() {
        if((dotT.x < width*0.1) || (dotT.x > width*0.9)) {
            changeCorse0 = !changeCorse0;
        }
        if(changeCorse0) {
            dotT = dotT.sub(vel0);
        } else if(!changeCorse0) {
            dotT = dotT.add(vel0);
        }
        if((dotB.x < width*0.1) || (dotB.x > width*0.9)) {
            changeCorse1 = !changeCorse1;
        }
        if(changeCorse1) {
            dotB = dotB.add(vel1);
        } else if(!changeCorse1) {
            dotB = dotB.sub(vel1);
        }
    }
}
