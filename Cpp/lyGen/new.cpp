#include <iostream>
#include <iomanip>
#include <string>
#include <fstream>
#include <cstdlib>
#include <ctime>
#include <algorithm>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

class David 
{
private: 
	string notes[15];
	int rand_index;	
public: 
	void printNotes();
	void generateNotes();
	David();	
};

void David::generateNotes()
{
	rand_index = rand() %15;
}	
David::David()
	: notes{"c'", "d'", "e'", "f'", "g'", "a'", "b'", "c''", "d''", "e''", 
		"f''", "g''", "a''", "b''", "c'''"                
		}		
{
	rand_index = rand() 15%;	
}
void David::printNotes() 
{
	#define lyGen "\
	#!/bin/bash \n\
	/Applications/LilyPond.app/Contents/Resources/bin/lilypond david.ly \n\
	exit \n\
	"
	generateNotes();

	std::ofstream o("david.ly");

	o << "\\version \"2.20.0\"" << std::endl;
	o << "" << std::endl;
	o << "violin =  {" << std::endl;
	o << "" << std::endl;
  o << "\t \\clef treble" << std::endl;
  o << "\t \\key c \\major" << std::endl;
  o << "\t \\time 4/4" << std::endl;
	o << "" << std::endl;

	for (unsigned int i = 0; i < 15; i++){
		o << rand_index+1 << notes[rand_index] << " ";
		 
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

}	
int main () 
{
	srand(time(0));
	David newDavid;

	newDavid.printNotes();
	return 0;
}
