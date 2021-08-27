\version "2.20.0"

upper = \relative c'' {
	\clef treble
	\key des \major
	\time 4/4

	c2 c
}

lower = \relative c {
	\clef bass
	\key des \major
	\time 4/4

	c2 c
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
