\version "2.20.0"

upper =  {

	 \clef treble
	 \key c \major
	 \time 4/4

e' d'' g'' c''' d'' f' f' b'' c'' e'' a' b' a'' g'' e' a'' 
\break
c''' c'' f'' b'' b' f'' a'' d'' f'' g' e' a' f' e' e' f'' 
\bar "|."

}

lower =  {

	 \clef bass
	 \key c \major
	 \time 4/4

f,1 g1 g1 d1 
\break
g, d, e, g 
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
