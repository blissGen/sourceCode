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

public class lines extends PApplet {

float x = 0;
float y = 0;

float spacing = 100;

boolean expand = true;


public void setup(){
    
    }


public void draw(){
    background(255);

    //line  specs
    stroke(0);
    strokeWeight(1);
    x= 0;

    //loops
    while (x < width){
        line(x, 0, x, height);
        x = x + spacing;
    }
    y= 0;
    while (y < width){
        line(0, y, width, y);
        y = y + spacing;
    }

    //boolean
    if(spacing > 200){
        expand = false;
    } else if (spacing < 25){
        expand = true;
    }
    if(expand){
        spacing = spacing + 1;
    } else if(!expand){
        spacing = spacing -1;
    }

    if (mousePressed == false){
      noCursor();
    }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lines" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
