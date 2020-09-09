float circleX;
float circleY;

float diameter;

float roy;
float biv;
float gee;

float alphaFade = 180;

void setup(){
    fullScreen();
    background(255);
}

void draw(){
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
    circleX = random(width*0.3, width*0.7);
    circleY = random(height*0.2, height*0.8);
    //circleY = circleY + random(0.01,0.05);

    if((alphaFade > 5) || (alphaFade < 220)){
        alphaFade = alphaFade + 0.8;
    }
    if(alphaFade >= 220){
        alphaFade = alphaFade - 200;
    }
}
void keyPressed(){
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
