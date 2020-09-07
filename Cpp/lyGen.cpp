#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <algorithm>
#include <fstream>

#define lyGen "\
#!/bin/bash \n\
/Applications/LilyPond.app/Contents/Resources/bin/lilypond david.ly \n\
exit \n\
"			

int main() {
		
	std::string notes[] = {"a4 ", "b4 ", "c4 ", "d4 ", "e4 ", "f4 ", "g4 "};

	std::ofstream o("david.ly");

	o << "\\version \"2.20.0\"" << std::endl;
	o << "" << std::endl;
	o << "violin = \\relative c' {" << std::endl;
	o << "" << std::endl;
  o << "\t \\clef treble" << std::endl;
  o << "\t \\key c \\major" << std::endl;
  o << "\t \\time 4/4" << std::endl;
	o << "" << std::endl;

/*	std::random_shuffle(&notes[1], &notes[7]); 
*/ 
	for (unsigned int i = 0; i < 7; i++){
		o << notes[i];
	}	o << std::endl;	
	
	o << "" << std::endl;
  o << "}" << std::endl;
	o << "" << std::endl;
	o << "\\header {" << std::endl;
	o << "\t title = \"\"" << std::endl;	
	o << "\t opus = \"\"" << std::endl;	
	o << "\t tagline = \"\"" << std::endl;	
	o << "}" << std::endl;
	o << "" << std::endl;	

  o << "\\score {" << std::endl;
  o << "\t \\new Staff = \"violin\" \\violin" << std::endl;
  o << "\t \\layout { }" << std::endl;
  o << "\t \\midi {" << std::endl;
  o << "\t \t \\tempo 4 = 120" << std::endl;
  o << "\t }" << std::endl;
  o << "}" << std::endl;

	system(lyGen);

	return 0;

}
