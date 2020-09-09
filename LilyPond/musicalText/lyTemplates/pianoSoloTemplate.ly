\version "2.20.0"

upper = \relative c'' {
	\clef treble
	\key c \major
	\time 4/4

	c2 c2
}

lower = \relative c {
	\clef bass
	\key c \major
	\time 4/4

	c1
}

\header {
	tagline = ""
}

\score {
	\new PianoStaff
	<<
		\new Staff = "upper" \upper
		\new Staff = "lower" \lower
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
