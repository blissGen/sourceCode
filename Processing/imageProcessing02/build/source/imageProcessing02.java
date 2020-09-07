import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class imageProcessing02 extends PApplet {

Shape s;
PImage img;

public void setup() {
    
    img = loadImage("bav.jpeg");
    img.resize(400, 400);
    s = new Shape();
}

public void draw() {
    background(00);
    s.display();
    //saveFrame("output/dogs_######.png");
}
class Shape {
    //float tilesX = map(mouseX, 0, width, 4, 500);
    float ratio = PApplet.parseFloat(height)/PApplet.parseFloat(width);
    float tilesX = map(mouseX, 0, width, 4, 500);
    float tilesY = ratio * tilesX;
    float tileSize = width / tilesX;
    float rectX = width*0.25f;
    float rectY = height*0.25f;
    int pixelColor;
    Shape() {
        // float ratio = float(height)/float(width);
        // float tilesX = map(mouseX, 0, width, 4, 500);
        // float tilesY = ratio * tilesX;
        // float tileSize = width / tilesX;
        // float rectX = width*0.25;
        // float rectY = height*0.25;
        // color pixelColor;
    }
    public void update() {

    }
    public void display() {
        for (int y = 0; y < img.height; y += tileSize) {
            for (int x = 0; x < img.width; x += tileSize) {
                int c = img.get(x, y);
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
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "imageProcessing02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
