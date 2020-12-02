global= {

}

violinOne = \new Voice \relative c'' {
	\key c \major 
	\time 4/4

	c
}

violinTwo = \new Voice \relative c'' {
	\key c \major 
	\time 4/4

	c
}

viola = \new Voice \relative c' {
  \clef alto
	\key c \major 
	\time 4/4

	c
}

cello = \new Voice \relative c, {
	\clef bass
 	\key c \major 
	\time 4/4

	c
}

\header {
	tagline = ""
}

\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = "Violin 1" }
    << \global \violinOne >>
    \new Staff \with { instrumentName = "Violin 2" }
    << \global \violinTwo >>
    \new Staff \with { instrumentName = "Viola" }
    << \global \viola >>
    \new Staff \with { instrumentName = "Cello" }
    << \global \cello >>
  >>
  \layout { }
  \midi { \tempo 4 = 110 }
}
