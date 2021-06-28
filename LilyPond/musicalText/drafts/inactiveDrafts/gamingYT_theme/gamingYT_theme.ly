\version "2.20.0"

upper = \relative c' {
	\clef treble
	\key d \major
	\time 4/4

	\partial 8 fis16[ gis] | 
	a4 fis8[ a] r cis r  b~ | 
	b2~ b4 r8 gis16[ ais] |
	b4 gis8[ b] r dis r cis~ | 
	cis2~ cis4 r8 b16[ cis] | 
	 

	d4. c8~ c4 bes~ | bes8 a4. g4 f | 
	e'4. d8~ d4 c~ | c8 bes4. a4 g |  
	

	<fis' e fis, >4. <fis e fis, >8 r4 < a, fis a,>4~ |
	<a fis a,>2~  <a fis a,>4. r8 | 
	\bar "|." 

}

lower = \relative c {
	\clef bass
	\key d \major
	\time 4/4
	
	\partial 8 r8 |
	<fis cis>4. <a cis,>8 r <fis cis> r4 | 
	b16[ fis dis b] a'[ fis dis b] dis e dis e dis4 | 

	<gis fis dis>4. <b fis dis>8 r <gis fis dis> r4 | 
	cis16[ gis eis cis] b'[ gis eis cis] eis fis eis fis eis4 |


	<d' bes>8[ <d bes> <d bes> <d a>] <d a>[ <d a> <bes f> <bes f>] | 
	<bes f>[ <f d> <f d> <f d>] <f~ bes,>4 <f b,> | 

	<e' c>8[ <e c> <e c> <e bes>] <e bes>[ <e bes> <c g> <c g>] | 
	<c g>[ <g e> <g e> <g e>] <g~ c,>4 <g cis,> | 


	<d' a d,>4. <d a d,>8 r4 <d, a d,>~ | 
	<d a d,>2~ <d a d,>4. r8 |
	\bar "|."

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

	\layout { 
		indent = #0 
	}
	\midi { 
		\tempo 4 = 140
	}
}

%\markup {
%  \line {
%  	hello world
%  }
%}
