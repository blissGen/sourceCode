\version "2.20.0"

violin = \relative c' {

	 \clef treble
	 \key c \major
	 \time 4/4

a4 b4 c4 d4 e4 f4 g4 

}

\header {
	 title = ""
	 opus = ""
	 tagline = ""
}

\score {
	 \new Staff = "violin" \violin
	 \layout { }
	 \midi {
	 	 \tempo 4 = 120
	 }
}
