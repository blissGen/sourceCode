float x = 0;
float y = 0;

float spacing = 100;

boolean expand = true;


void setup(){
    fullScreen();
    }


void draw(){
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
