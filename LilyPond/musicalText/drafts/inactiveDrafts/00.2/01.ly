\version "2.20.0"

upper = \relative c'' {

	\clef treble
	\key c \major
	\time 4/4

	c4.. c16( b4..) b16( | c4 b bes c,) |
	r1 | r1 | 
	r1 | r1 | \break
	r1 | r1 |
	r1 | r1 |

}

lower = \relative c {

	\clef bass
	\key c \major
	\time 4/4

	c2( g2 |  c, g') |	
	 
	<<
		{ f''2( c | f, c') | } \\
		{ a,4.. a16( bes4..) bes16_( | c4 d e g) | } 
	>>	
	<<
		{ d'2( bes) | bes4( a g f) | } \\
		{ bes,4_( a g f) | f1 | } \\
		{ f'1 | d2_( bes_) | }
	>> \break
	<<
		{ e4 g 
			<<	
				{ g } { f }	
			>>
			<<
				{ b! } { g } { f } { d } 
			>> |
		} \\
		{ c2 aes4 g |
			<<
			  { c'2 } { ees, } \\
				{ c2 } { c, } 
			>> 
			<< 
				{ r2 | } \\ { r2 | } 
			>>	
		}
	>>
	<<
		{ ees'4 g 
			<<	
				{ g } { f }	
			>>
			<<
				{ b } { g } { f } { d } 
			>> |
		} \\
		{ g,4 f ees d |
			<<
				{ e''2 } { c } { g } \\
				{ c,2 } { c, } 
			>> 
			<< 
				{ r2 | } \\ { r2 | } 
			>>	
		}
	>>	
}	  	

\score {

	\new PianoStaff
	<<
		\new Staff = "upper" \upper
		\new Staff = "lower" \lower
	>>

	\layout { }
	\midi { 
		\tempo 4 = 120
	}

}

%\markup {

%  \line {
%  	hello world
%  }

%}
