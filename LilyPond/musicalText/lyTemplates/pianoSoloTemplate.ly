\version "2.20.0"

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
	title = \markup {
		\center-column {
			\vspace #2
			\huge \caps "title"
			\vspace #3
		}
	}
	tagline = ""
}
\paper {
	#(set-paper-size "a4")
  system-system-spacing.basic-distance = #18
	score-system-spacing =
		#'((basic-distance . 12)
			(minimum-distance . 6)
			(padding . 1)
			(stretchability . 12))
	page-breaking = #ly:optimal-breaking
}
\score {
	\new PianoStaff \with { 
		instrumentName = \markup {
		  \number {
		 		1.
		  }
		}
	}
	<<
		\new Staff = "upper" \upper
		\new Staff = "lower" \lower
	>>
	\layout {
		#(layout-set-staff-size 20.5)
	}
	\midi { 
		\tempo 4 = 125
	}
}%\markup {
%  \line {
%  	hello world
%  }
%}
