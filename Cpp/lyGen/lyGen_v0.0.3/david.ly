\version "2.20.0"

upper =  {

	 \clef treble
	 \key c \major
	 \time 4/4

b' d' b' b' d' c' g' g'' g' b' b' g' a'' e' b' b'' 
\break
b' d' b' b' d' c' g' g'' g' b' b' g' a'' e' b' b'' 
\bar "|."

}

lower =  {

	 \clef bass
	 \key c \major
	 \time 4/4

b1 c,1 f,1 c'1 
\break
a1 c1 c,1 g1 
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
