\version "2.20.0"

upper = \relative c'' {
	\clef treble
	\key f \minor
	\time 4/4

	des8 c aes des c aes des c 
	aes	des c aes f16 g aes bes c4
	des8 c aes des c aes des c 
	aes des c aes f16 g aes bes c4
	\break

	des8 c bes des c bes des c 
	bes des c bes bes16 b c des f4~ 
	\time 2/4
	f4.~ ees8
	\time 4/4
	<ees des> c aes des c aes des c 
	aes des c aes des c aes des
	\break

}

lower = \relative c {
	\clef bass
	\key f \minor
	\time 4/4

	f,4 <c' f aes> f, <f' aes c> 
	f, <c' f aes> f, <g' bes c e>
	f, <c' f aes> f, <f' aes c> 
	f, <c' f aes> f, <g' bes c e>
	\break

	ees, <des' ees g> <des ees g> <des ees g>
	r <des ees g> <des ees g> <g, ees'>
	\time 2/4
	r2
	\time 4/4
	aes4 <ees' aes c> <ees aes c> <ees aes c>
	<ees c'> <ees c'> <ees c'> c,
	\break


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
