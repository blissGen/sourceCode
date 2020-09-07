Shape s;
PImage img;

void setup() {
    size(800, 800);
    img = loadImage("bav.jpeg");
    img.resize(400, 400);
    s = new Shape();
}

void draw() {
    background(00);
    s.display();
    //saveFrame("output/dogs_######.png");
}
class Shape {
    //float tilesX = map(mouseX, 0, width, 4, 500);
    float ratio = float(height)/float(width);
    float tilesX = map(mouseX, 0, width, 4, 500);
    float tilesY = ratio * tilesX;
    float tileSize = width / tilesX;
    float rectX = width*0.25;
    float rectY = height*0.25;
    color pixelColor;
    Shape() {
        // float ratio = float(height)/float(width);
        // float tilesX = map(mouseX, 0, width, 4, 500);
        // float tilesY = ratio * tilesX;
        // float tileSize = width / tilesX;
        // float rectX = width*0.25;
        // float rectY = height*0.25;
        // color pixelColor;
    }
    void update() {

    }
    void display() {
        for (int y = 0; y < img.height; y += tileSize) {
            for (int x = 0; x < img.width; x += tileSize) {
                color c = img.get(x, y);
                float b = map(brightness(c), 0, 255, 0, 1);
                pixelColor  = img.get(x, y);
                pushMatrix();
                translate(x, y);
                rectMode(CENTER);
                noStroke();
                fill(pixelColor);
                rect(rectX, rectY, b*tileSize, b*tileSize);
                popMatrix();
            }
        }
    }
}
