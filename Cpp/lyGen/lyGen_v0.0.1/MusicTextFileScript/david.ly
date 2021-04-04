\version "2.20.0"

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

\score {
	 \new Staff = "violin" \violin
	 \layout { }
	 \midi {
	 	 \tempo 4 = 120
	 }
}
