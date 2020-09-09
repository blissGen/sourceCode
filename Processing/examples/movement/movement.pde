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

void setup(){
    fullScreen();

    xPos = width*0.25;
    yPos = height*0.25;

    alphaFade = 255;
}

void draw(){
    background(00);

    x = xPos + 2.5;
    y = yPos + 5;

    fill(255, alphaFade);
    ellipse(x, y, 100, 100);

    if (xPos > width*0.75){
        travelX = false;
    } else if (xPos < width*0.25){
        travelX = true;
    }
    if (travelX){
        xPos = xPos + 5;
    } else if (!travelX){
        xPos = xPos - 10;
    }

    if (yPos > height*0.75){
        travelY = false;
    } else if (yPos < height*0.25){
        travelY = true;
    }
    if (travelY){
        yPos = yPos + 10;
    } else if (!travelY){
        yPos = yPos - 5;
    }

    if (((xPos < width*0.5) && (yPos < height*0.5)) || ((xPos > width*0.5) && (yPos > height*0.5))){
        background(00);
        fill(255, alphaFade);
        ellipse(x, y, 100, 100);
    }
    if (((xPos > width*0.5) && (yPos < height*0.5)) || ((xPos < width*0.5) && (yPos > height*0.5))){
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
