float x;
float y;

float roy = random(0,255);
float biv = random(0,255);
float gee = random(0,255);

float scroll = 30;

boolean ticker = true;
boolean colorPicker = true;

void setup() {
    fullScreen();
}
void draw() {

    background(00);

    for (x = width*0.1; x < width*0.9; x = x + scroll) {
        for(y = height*0.1; y < height*0.9; y = y + scroll) {
            noStroke();
            fill(roy, biv, gee);
            ellipse(x, y, 25, 25);
        }
    }

    if ((scroll < 30) || (scroll > 100)) {
        ticker = !ticker;
    }
    if (ticker) {
        scroll = scroll + 0.7;
    }
    if (!ticker) {
        scroll = scroll - 0.7;
    }
}
