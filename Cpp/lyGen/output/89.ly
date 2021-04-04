\version "2.20.0"

upper =  {

	 \clef treble
	 \key c \major
	 \time 4/4

g' f' g'' e'' e'' b' f' a'' c''' g' e'' g' g'' e'' d'' g' 
\break
a'' f' a'' f'' g'' c'' b' d' g'' c'' b' e'' a' b' d' e' 
\bar "|."

}

lower =  {

	 \clef bass
	 \key c \major
	 \time 4/4

e,1 g,1 g1 a,1 
\break
b, f g f, 
\bar "|."

}

\header {
	 title = ""
	 opus = ""
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
	 	 \tempo 4 = 160
	 }
}
