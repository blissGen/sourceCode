violin  = \relative c'' {
	\clef treble
	\key c \major
	\time 4/4
	
	c4 c c c
}

cello = \relative c {
	\clef bass
	\key c \major
	\time 4/4
	
	c4 c c c
}

upper = \relative c'' {
	\clef treble
	\key c \major
	\time 4/4

	c2 c
}

lower = \relative c {
	\clef bass
	\key c \major
	\time 4/4

	c2 c
}

\header {
	tagline = ""
}

\score {
	<<
		\new Voice = "vln" { 
			\autoBeamOff 
			\magnifyStaff #5/7
			\violin 
		}
		\new Voice = "Cll" { 
			\autoBeamOff 
			\magnifyStaff #5/7
			\cello 
		}
		\new PianoStaff
		<<
			\new Staff = "upper" \upper
			\new Staff = "lower" \lower
		>>
	>>
	\layout { }
	\midi { 
		\tempo 4 = 100
	}
}

%\markup {
%  \line {
%  	hello world
%  }
%}
