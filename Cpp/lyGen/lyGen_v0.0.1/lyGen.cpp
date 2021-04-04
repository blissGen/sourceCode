#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <time.h>

#define lyGen "\
#!/bin/bash \n\
/Applications/LilyPond.app/Contents/Resources/bin/lilypond david.ly \n\
exit \n\
"

int main() {

	srand ( time(NULL) ); 

	std::string bassNotes[] = {
		"c,", "d,", "e,", "f,", "g,",
		"a,", "b,", "c", "d", "e", "f", "g",
		"a", "b", "c'" 
	};

	std::string trebleNotes[] = {
		"c'", "d'", "e'", "f'", "g'",
		"a'", "b'", "c''", "d''", "e''", "f''", "g''",
		"a''", "b''", "c'''" 
	};

	std::ofstream o("david.ly");

	o << "\\version \"2.20.0\"" << std::endl;
	o << "" << std::endl;
	o << "upper =  {" << std::endl;
	o << "" << std::endl;
  o << "\t \\clef treble" << std::endl;
  o << "\t \\key c \\major" << std::endl;
  o << "\t \\time 4/4" << std::endl;
	o << "" << std::endl;

	for (int i = 0; i < 16; i++){
		int RandIndex = rand() %15;
		o << trebleNotes[RandIndex] << " ";
	}	o << std::endl;

	o << "\\break" << std::endl;

	for (int i = 0; i < 16; i++){
			int RandIndex = rand() %15;
			o << trebleNotes[RandIndex] << " ";
		}	o << std::endl;

	o << "\\bar \"|.\""	<< std::endl;
	o << "" << std::endl;
  o << "}" << std::endl;
	o << "" << std::endl;

	o << "lower =  {" << std::endl;
	o << "" << std::endl;
  o << "\t \\clef bass" << std::endl;
  o << "\t \\key c \\major" << std::endl;
  o << "\t \\time 4/4" << std::endl;
	o << "" << std::endl;

	for (int i = 0; i < 4; i++){
		int RandIndex = rand() %15;
		o << bassNotes[RandIndex] << "1 ";
	}	o << std::endl;

	o << "\\break" << std::endl;

	for (int i = 0; i < 4; i++){
			int RandIndex = rand() %15;
			o << bassNotes[RandIndex] << " ";
		}	o << std::endl;

	o << "\\bar \"|.\""	<< std::endl;
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
	o << "\t \\new PianoStaff" << std::endl;
	o << "\t <<" << std::endl;
  o << "\t \t \\new Staff = \"upper\" \\upper" << std::endl;
  o << "\t \t \\new Staff = \"lower\" \\lower" << std::endl;
	o << "\t >>" << std::endl;
  o << "\t \\layout { }" << std::endl;
  o << "\t \\midi {" << std::endl;
  o << "\t \t \\tempo 4 = 160" << std::endl;
  o << "\t }" << std::endl;
  o << "}" << std::endl;

	system(lyGen);

	return 0;

}
