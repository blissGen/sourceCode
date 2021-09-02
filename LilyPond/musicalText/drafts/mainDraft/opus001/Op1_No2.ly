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
	f4. ees8
	\time 4/4
	<ees des> c aes des c aes des c 
	aes des c aes des c aes c
	\break

	\time 3/4
	<c des>2 <c des>8. <c des>16
	<bes c>2 <bes c>8. <bes c>16
	<bes c>4 <beses cis> <aes d> 
	<aes d>2 <g~ ees'~>4
	\break

	<g ees'>2 <d f aes c>8. <d f g b>16 
	<d f g d'>2 b'4 
	<g, e' bes'>2 \arpeggio <e' g bes c>4
	\time 4/4 
	<des' f>8 c <aes f'> des <c f> aes <des f> c 
	\break

	<aes f'> des <c f> aes <f g'>16 g aes bes <c e> 4
	<des f>8 c <aes f'> des <c f> aes <des f> c 
	<aes f'> des <c f> aes <f g'>16 g aes bes <c e> 4

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
	aes4 <ees' aes c> aes,  <ees' aes c>
	<ees aes c> <ees aes c> <ees c'> c,
	\break

	\time 3/4
	des <f des'> <aes f'> 
	bes, <des bes'> <f des' bes>
	bes, <beses'' ces ees> <f aes bes d>
	ees, <bes' ees g> <g' bes> 
	\break

	<g bes ees> <ees g bes> <f, f'> 
	g <d' g b> <d g b>
	<c, c'> <aes' aes'> <g g'>
	\time 4/4
	f4 <c' f aes> f, <f' aes c> 
	\break
	f, <c' f aes> f, <g' bes c e>
	f, <c' f aes> f, <f' aes c> 
	f, <c' f aes> f, <g' bes c e>

}

\header {
	tagline = ""
}
\paper {
  system-system-spacing.basic-distance = #18
	score-system-spacing =
		#'((basic-distance . 12)
			(minimum-distance . 6)
			(padding . 1)
			(stretchability . 12))
}
\score {
	\new PianoStaff
	<<
		\new Staff = "upper" \upper
		\new Staff = "lower" \lower
	>>
	\layout {
		#(layout-set-staff-size 22)
	}
	\midi { 
		\tempo 4 = 125
	}
}

%\markup {
%  \line {
%  	hello world
%  }
%}
