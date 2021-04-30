#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
using namespace std;

class NoteGeneration {
};

class David {
	private: 
	public:
		void BashScript() {
			#define lyGen "\
			#!/bin/bash \n\
			/Applications/LilyPond.app/Contents/Resources/bin/lilypond david.ly \n\
			exit \n\
			"
			system(lyGen);
		};

		void GenerateNotesT(std::ofstream &o) {
			std::string trebleNotes[] = {
				"c'", "d'", "e'", "f'", "g'",
				"a'", "b'", "c''", "d''", "e''", "f''", "g''",
				"a''", "b''", "c'''", "r" 
			};
			o << "\t";
			for (int i = 0; i < 16; i++){
				int RandIndex = rand() %16;
				o << trebleNotes[RandIndex] << " ";
			}	
			o << std::endl << "\t\\break" << std::endl;
			o << std::endl;
		};

		void GenerateNotesB(std::ofstream &o) {
			std::string bassNotes[] = {
				"c,", "d,", "e,", "f,", "g,",
				"a,", "b,", "c", "d", "e", "f", "g",
				"a", "b", "c'", "r" 
			};
			o << "\t";
			for (int i = 0; i < 4; i++){
				int RandIndex = rand() %16;
				o << bassNotes[RandIndex] << "1 ";
			}				
			o << std::endl << "\t\\break" << std::endl;
			o << std::endl;
		};	

		void mkms() {

		std::ofstream o;
		o.open("david.ly");	
	
		o << "\\version \"2.20.0\"" << std::endl;
		o << "" << std::endl;
		o << "upper =  {" << std::endl;
		o << "" << std::endl;
	  o << "\t\\clef treble" << std::endl;
	  o << "\t\\key c \\major" << std::endl;
	  o << "\t\\time 4/4" << std::endl;
		o << "" << std::endl;
	
		GenerateNotesT(o);
		GenerateNotesT(o);
		GenerateNotesT(o);
		GenerateNotesT(o);

		o << "\t\\bar \"|.\""	<< std::endl;
		o << "" << std::endl;
	  o << "}" << std::endl;
		o << "" << std::endl;
	
		o << "lower =  {" << std::endl;
		o << "" << std::endl;
	  o << "\t\\clef bass" << std::endl;
	  o << "\t\\key c \\major" << std::endl;
	  o << "\t\\time 4/4" << std::endl;
		o << "" << std::endl;
		
		GenerateNotesB(o);	
		GenerateNotesB(o);	
		GenerateNotesB(o);	
		GenerateNotesB(o);	

		o << "\t\\bar \"|.\""	<< std::endl;
		o << "" << std::endl;
	  o << "}" << std::endl;
		o << "" << std::endl;
	
		o << "\\header {" << std::endl;
		o << "\ttitle = \"\"" << std::endl;
		o << "\topus = \"\"" << std::endl;
		o << "\ttagline = \"\"" << std::endl;
		o << "}" << std::endl;
		o << "" << std::endl;
	
	  o << "\\score {" << std::endl;
		o << "\t\\new PianoStaff" << std::endl;
		o << "\t<<" << std::endl;
	  o << "\t \t\\new Staff = \"upper\" \\upper" << std::endl;
	  o << "\t \t\\new Staff = \"lower\" \\lower" << std::endl;
		o << "\t >>" << std::endl;
	  o << "\t\\layout {" << std::endl;
	  o << "\t \tindent = #0" << std::endl;
	  o << "\t}" << std::endl;
	  o << "\t\\midi {" << std::endl;
	  o << "\t\t \\tempo 4 = 160" << std::endl;
	  o << "\t}" << std::endl;
	  o << "}" << std::endl;

		o.close();

		BashScript();	
		}
};

int main() {

	srand ( time(0) ); 
	David D;
	D.mkms();

	return 0;

}
