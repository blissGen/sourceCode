\version "2.20.0"

upper = \relative c'' {
	\clef treble
	\key ges \major
	\time 4/4

	<bes des ges>4 <bes des ges>8. <bes des ges>16
	<ces des f aes>4 <ces des f aes>8. <ces des f aes>16 |

}

lower = \relative c {
	\clef bass
	\key ges \major
	\time 4/4

	ges4 <des' bes'>
	f, <des' aes'> |
	ges,4 <des' bes'>
	ges,4 <des' bes'> |
	
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
