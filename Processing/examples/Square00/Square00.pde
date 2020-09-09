Square[] squares = new Square[100];
void setup() {
    fullScreen();
    //size(800, 800);
    float x = width*0.05;
    float y = height*0.05;
    int k = 0;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            squares[k] = new Square(x + i * width*0.1, y + j * height*0.1);
            k++;
        }
    }
}
void draw() {
    background(00);
    for (int i = 0; i < squares.length; i++) {
        squares[i].display();
        squares[i].spin();
    }
    if (mousePressed == false){
      noCursor();
    }
}
class Square {
    PVector loc, vel, acc;
    float x, y, a, aVel, aAcc;

    Square(float x, float y) {
        this.x = x;
        this.y = y;
        a = 0;
        aVel = 0.0;
        aAcc = random(-0.001, 0.001);
    }
    void display() {
        rectMode(CENTER);
        noStroke();
        fill(255);
        pushMatrix();
        translate(this.x, this.y);
        rotate(a);
        rect(0, 0, 60, 60);
        popMatrix();
    }
    void spin() {
        a += aVel;
        aVel += aAcc;
        aVel = constrain(aVel, -0.05, 0.05);
    }
}
