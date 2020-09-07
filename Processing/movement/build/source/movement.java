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

public class movement extends PApplet {

float x;
float y;

float xPos;
float yPos;

//float roy = random(0, 225);;
//float biv = random(0, 225);;
//float gee = random(0, 225);;
float alphaFade;

boolean travelX = true;
boolean travelY = true;

public void setup(){
    

    xPos = width*0.25f;
    yPos = height*0.25f;

    alphaFade = 255;
}

public void draw(){
    background(00);

    x = xPos + 2.5f;
    y = yPos + 5;

    fill(255, alphaFade);
    ellipse(x, y, 100, 100);

    if (xPos > width*0.75f){
        travelX = false;
    } else if (xPos < width*0.25f){
        travelX = true;
    }
    if (travelX){
        xPos = xPos + 5;
    } else if (!travelX){
        xPos = xPos - 10;
    }

    if (yPos > height*0.75f){
        travelY = false;
    } else if (yPos < height*0.25f){
        travelY = true;
    }
    if (travelY){
        yPos = yPos + 10;
    } else if (!travelY){
        yPos = yPos - 5;
    }

    if (((xPos < width*0.5f) && (yPos < height*0.5f)) || ((xPos > width*0.5f) && (yPos > height*0.5f))){
        background(00);
        fill(255, alphaFade);
        ellipse(x, y, 100, 100);
    }
    if (((xPos > width*0.5f) && (yPos < height*0.5f)) || ((xPos < width*0.5f) && (yPos > height*0.5f))){
        background(255);
        fill(00, alphaFade);
        rectMode(CENTER);
        rect(x, y, 100, 100);
    }
    if (mousePressed == false){
      noCursor();
    }
    //saveFrame("output/movment_######.png");
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "movement" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
