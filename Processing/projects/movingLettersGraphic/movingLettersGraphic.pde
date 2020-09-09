//Moving Letters Graphic for A/V Projects

ArrayList <LetterSystem> lSystems;
//PFont hFont;
PFont wngdngs1;
//PFont wbdngs;

void setup() {
		//hFont = createFont("Helvetica", 100, true);
		wngdngs1 = createFont("Wingdings", 100, true);
		//wbdngs = createFont("Webdings", 100, true);

    size(1080, 720);
		lSystems = new ArrayList<LetterSystem>();
		lSystems.add(new LetterSystem(new PVector(width*0.5, height*0.5)));
}
void draw() {
    background(255);
		for (LetterSystem ls: lSystems) {
				PVector grav = new PVector(-10, -3);
				PVector origin = new PVector(width*0.5, height*0.5);
				ls.applyForce(grav);
				ls.run();
				ls.letterMove();
				ls.addLetter();
		}
		saveFrame("output/wingdingsReel/movment_######.png");
}

class LetterSystem {
		ArrayList <Letter00> letters;
		PVector origin;
		float a, r, n, t, x;
		LetterSystem(PVector l) {
				letters = new ArrayList<Letter00>();
				origin = new PVector(width*1.85, 0);
				r = width*0.15;
				a = 0;
				t = 0;
		}
		void applyForce(PVector f) {
				for (Letter00 p: letters) {
						p.applyForce(f);
				}
		}
		void letterMove() {
				//origin.y = r * sin(a) + height*0.2;
				origin.y = random(0, height*1.9);
				a += x;
				n = noise(t);
				t += 0.01;
				x = map(n, 0, 1, 0, 0.03);
		}
		void addLetter() {
				float r0 = random(1);
				if (r0 < 0.25) {
						letters.add(new Letter00 (origin));
				}								
		}
  	void run() {
				for (int i = letters.size() - 1; i >= 0; i--) {
						Letter00 p = letters.get(i);
						p.update();
						p.display();
						//l.spin();
						if (p.fullCycle()) {
								letters.remove(i);
						}
				}
		} 
}

class Letter00 {
    PVector loc, vel, acc;
    float a, mass, size, cycle, r, g, b, spacing;
		//String one = "always";
		//String two = "waiting";
		String wd1 = ">";
	  //String wd2 = "N";
		//String[] strings = {
		//		"a", "l", "w", "a", "y", "s"
		//};
    Letter00(PVector l) {
        loc = l.get();
        vel = new PVector();
        acc = new PVector(0, 0);
        mass = 1;
        cycle = 255;
				spacing = 100;
    }
    void applyForce(PVector force) {
        PVector f = force.get();
        f.div(mass);
        acc.add(f);
    }
    void update() {
        vel.add(acc);
        loc.add(vel);
        vel.limit(2);
        acc.mult(0);
        cycle -= 0.15;
        mass += 0.4;
    }
    void display() {
				//for (int i = 0; i < one.length(); i++) {
				//		text(one.charAt(i), loc.x, loc.y, mass);
				//		spacing += textWidth(one.charAt(i));
				//}
        text(wd1, loc.x, loc.y, mass, mass);
				textFont(wngdngs1);
				textSize(90);
				fill(0);
        if (mousePressed == false){
          noCursor();
        }
    }
    boolean fullCycle() {
        if (cycle <= 0) {
            return true;
        } else {
            return false;
        }
    }
}
