\version "2.20.0"
global= {
	\partial 2
}

violinOne = \new Voice \relative c'' {
	\key c \minor 
	\time 4/4

	r2 | r1 |

	c,1 | g'4. f8 ees4. d8 
	| d8 ees c4( c2) | \acciaccatura b16 c2 \acciaccatura des16 c4. g8 | 
	aes 1 | \break  aes'4. g8 g4. f8 | 
	f1 | aes4. g8 g4. f8 |
	f1 | g'4 r r2 |


}

violinTwo = \new Voice \relative c'' {
	\key c \minor 
	\time 4/4

	<c, g' ees'>4 r | <bis g' d'> r r r | 
	r1 | r1 | 
	r1 | \break r1 | 
	r1 | r1 | 
	f'4. ees8 ees4. d8 | d1
	f4. ees8 ees4. d8 | d4 r r2
	
}

viola = \new Voice \relative c' {
  \clef alto
	\key c \minor 
	\time 4/4
	
	g4 r | g1 | 

	ees4 ees ees ees | ees ees ees g | 
	ees ees ees ees | ees ees ees e | 
	f f f f | \break f f f f |
	aes aes aes aes | aes aes aes aes |
	fis fis fis fis | <g b>4 r r2 |
 
}

cello = \new Voice \relative c, {
	\clef bass
 	\key c \minor 
	\time 4/4

	g'4 r | g1 |

	c4 c c c | c c c b | 	
	c c c c | c c c bes| 
	aes aes aes aes | \break f f f f|
	f f f f | fis fis fis fis | 
	fis fis fis fis | g4 r r2 | 

}

\header {
	tagline = ""
}

\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = "Violin 1" }
    << \global \violinOne >>
    \new Staff \with { instrumentName = "Violin 2" }
    << \global \violinTwo >>
    \new Staff \with { instrumentName = "Viola" }
    << \global \viola >>
    \new Staff \with { instrumentName = "Cello" }
    << \global \cello >>
  >>
  \layout { }
  \midi { 
		\tempo 4 = 160 
	}
}
