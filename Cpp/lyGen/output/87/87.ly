\version "2.20.0"

upper =  {

	\clef treble
	\key c \major
	\time 4/4

	g'' a'' a'' b'' b' d'' c'' g' g' c'' f' a' e' c' b' g'' 
	\break

	f'' d' d'' a'' f' c'' e'' b'' r d'' c' a'' a'' b'' a'' f' 
	\break

	d' c' b' c''' b'' a' d'' r c''' a' d' c'' c'' d' b' a'' 
	\break

	c''' a'' c''' c'' g'' r c''' a' e'' g' f'' a' r d' d' c'' 
	\break

	\bar "|."

}

lower =  {

	\clef bass
	\key c \major
	\time 4/4

	g1 d1 d1 c,1 
	\break

	b1 e,1 c1 e,1 
	\break

	r1 g,1 e1 d,1 
	\break

	d1 d,1 c,1 c1 
	\break

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
	\layout {
	 	indent = #0
	}
	\midi {
		 \tempo 4 = 160
	}
}
