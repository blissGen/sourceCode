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

public class visualize extends PApplet {

float circleX;
float circleY;

float diameter;

float roy;
float biv;
float gee;

float alphaFade = 180;

public void setup(){
    
    background(255);
}

public void draw(){
    //background(100);
    //object
    if (mousePressed == false){
      noCursor();
    }
    fill(roy, biv, gee, alphaFade);
    noStroke();
    diameter = random(50,100);
    ellipse(circleX,circleY,diameter,diameter);
    //motion
    circleX = random(width*0.3f, width*0.7f);
    circleY = random(height*0.2f, height*0.8f);
    //circleY = circleY + random(0.01,0.05);

    if((alphaFade > 5) || (alphaFade < 220)){
        alphaFade = alphaFade + 0.8f;
    }
    if(alphaFade >= 220){
        alphaFade = alphaFade - 200;
    }
}
public void keyPressed(){
    background(roy, biv, gee, alphaFade);
    roy =random(0,255);
    biv =random(0,255);
    gee =random(0,255);
    alphaFade = 0;

    if (alphaFade < 255){
        alphaFade = alphaFade + 10;
    }
    alphaFade = 60;
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "visualize" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
