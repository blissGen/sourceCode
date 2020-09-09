\version "2.20.0"

allegro = \markup { \large Allegro}
trio = \markup { \large Trio }

violin = \relative c' {

	\clef treble
	\key c \major
	\time 4/4

	c2 c2

}

\header {
	title = ""
	opus = ""
	tagline = "" 
}

\markup {
	\vspace #1
}

\score {

	\new Staff = "violin" \violin

	\layout { }
	\midi { 
		\tempo 4 = 100
	}

}

\paper {
	top-margin = 10
	system-system-spacing =
		#'((basic-distance . 14) 
    (minimum-distance . 8)
    (padding . 5.5)
    (stretchability . 60)) 
}

%\markup {
%  \line {
%  	hello world
%  }
%}
