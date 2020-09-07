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

public class slidingShapes extends PApplet {

float x;
float y;

float roy = random(0,255);
float biv = random(0,255);
float gee = random(0,255);

float scroll = 30;

boolean ticker = true;
boolean colorPicker = true;

public void setup() {
    
}
public void draw() {

    background(00);

    for (x = width*0.1f; x < width*0.9f; x = x + scroll) {
        for(y = height*0.1f; y < height*0.9f; y = y + scroll) {
            noStroke();
            fill(roy, biv, gee);
            ellipse(x, y, 25, 25);
        }
    }

    if ((scroll < 30) || (scroll > 100)) {
        ticker = !ticker;
    }
    if (ticker) {
        scroll = scroll + 0.7f;
    }
    if (!ticker) {
        scroll = scroll - 0.7f;
    }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "slidingShapes" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
