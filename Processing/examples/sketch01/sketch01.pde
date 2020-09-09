Dot0[] dots0 = new Dot0[300];
Dot1[] dots1 = new Dot1[300];

void setup() {
    size(1000, 1000);
    for (int i = 0; i < dots0.length; i++) {
        dots0[i] = new Dot0();
    }
    for (int  i = 0; i < dots1.length; i++) {
        dots1[i] = new Dot1();
    }
}
void draw() {
    background(00);

    for (int i = 0; i < dots0.length; i++) {
    dots0[i].display();
    dots0[i].movment();
    dots0[i].end();
    }
    for (int i = 0; i < dots1.length; i++) {
    dots1[i].display();
    dots1[i].movment();
    dots1[i].end();
    }
    if (mousePressed == false){
      noCursor();
    }
}

class Dot0 {
    float x;
    float y;

    float roy;
    float biv;
    float gee;

    float move = 3;
    Dot0() {
        x = width*0.1;
        y = random(height*0.1, height*0.9);

        roy = random(255);
        biv = random(255);
        gee = random(255);
    }
    void display() {
        noStroke();
        ellipse(x, y, 20, 20);
        fill(roy, biv, gee);
    }
    void movment() {
        x = x + move;
        y = y - move;
    }
    void end() {
        if (y < height*0.1) {
            x = width*0.1;
            y = random(height*0.1, height*0.9);
        }
    }
}
class Dot1 {
    float x;
    float y;

    float roy;
    float biv;
    float gee;

    float move = 3;
    Dot1() {
        x = width*0.9;
        y = random(height*0.1, height*0.9);

        roy = random(255);
        biv = random(255);
        gee = random(255);
    }
    void display() {
        noStroke();
        ellipse(x, y, 20, 20);
        fill(roy, biv, gee);
    }
    void movment() {
        x = x - move;
        y = y + move;
    }
    void end() {
        if (y > height*0.9) {
            x = width*0.9;
            y = random(height*0.1, height*0.9);
        }
    }
}
