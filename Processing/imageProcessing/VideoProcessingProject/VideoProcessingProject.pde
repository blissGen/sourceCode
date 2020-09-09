import processing.video.*;
import ddf.minim.*;

//Minim minim;
//AudioPlayer player;
Movie video;
Shape s;
//PImage img;

void setup() {

  size(1080, 720);
	//fullScreen();
	frameRate(10);
  //img = loadImage("bav.jpeg");
  //img.resize(400, 400);
	video = new Movie(this, "catVideo.mov");
  //minim = new Minim(this);
	//player = minim.loadFile("Audiopane_InsideTheSun.wav");
	video.play();
	video.loop();
	//player.play();
  s = new Shape();

}

void movieEvent(Movie video) {

	video.read();

}

void draw() {
    
	image(video, 0, 0);
	background(00);
  s.display();
  saveFrame("output/canvas_######.png");

}

class Shape {

  //float tilesX = map(mouseX, 0, width, 4, 500);
  float ratio = float(height)/float(width);
  float tilesX = 25;
  float tilesY = ratio * tilesX;
  float tileSize = width / tilesX;
  float rectX = 0;
  float rectY = 0;
  color pixelColor;

  Shape() {

  }

  void update() {
  
  }

  void display() {

    for (int y = 0; y < video.height; y += tileSize) {
      for (int x = 0; x < video.width; x += tileSize) {
        color c = video.get(x, y);
        float b = map(brightness(c), 175, 255, 0, 0.75);
        pixelColor = video.get(x, y);
				//float a = map(player.left.level(), 0, 0.2, 15, 0);  
        pushMatrix();
        translate(x, y);
        rectMode(CENTER);
        noStroke();
        fill(pixelColor);
        rect(rectX, rectY, b*tileSize, b*tileSize /*, a*/);
        popMatrix();
      }
    }

  }

}
