\version "2.20.0"

moltoAllegro = \markup { \large Molto allegro}
trio = \markup { \large Trio }
	
violin = \relative c' {

	\clef treble
	\tempo "Molto allegro"
%  \tweak X-offset #-4 \tweak Y-offset #4 ^\moltoAllegro

	\key c \major
	\time 3/4
  

	c4 
	<g' e'>
	c, |

	g 
	<e' d'>(
	<f d'>) |

	g,
	<b' g'>
	g, |

	b a g \bar ".|:"

	c
	<g' e' c'>
	c,( |

	cis) 
	<a' e' cis'>
	cis,( | 

	d)
	<a' f' d'>
	d,( |

	b)
	<g' d' b'>
	b,( |

	\break

	c)
	<g' e' c'>
	c,( |

	a) 
	<f' c' a'>
	a,( |

	bes)
	<f' d' bes'>
	bes,( |

	b!)
	<g' d' b'!>
	b, \bar ":|.|:"
	
	c
	<g' ees' c'>
	c,( |

	d) 
	<b' g' d'>
	d,( |

	ees)
	<c' g' ees'>
	ees,( |

	e!)
	<c' g' e'!>
	e,( |

	\break

	f) 
	<d' aes' f' >
	f,( |

	d)
	<bes' f' d'>
	d,( |

	ees)
	<bes' g' ees'>
	ees,( |

	b)
	<g' d' b'>
	b, \bar ":|."

  \once \override Score.RehearsalMark.font-size = #-1
  \tweak X-offset #3
	\mark \markup { \musicglyph #"scripts.segno" }
	
	g
	<d' b' g'>
	g,( |

	b)
	<g' d' b'>
	b,( |

	g)
	<d' b' g'>
	g, |

	aes8( bes c des ees f |

	\break

	g aes) 
  <aes aes,>4 
	<aes aes,>

	g,
	<c' aes'>
	<b g'> |

	g, a b |

	c
	\tuplet 6/4 { 
		g'16( e' c' c e, g,)
	}	
	c,4( |

 	c)
	\omit TupletNumber 
	\tuplet 6/4 { 
		a'16( f' c' c f, a,)
	}	
	c,4( |

	d)
	\omit TupletNumber
	\tuplet 6/4 { 
		b'16( g' d' d g, b,)
	}	
	d,4( |

 	e)
	\omit TupletNumber			
	\tuplet 6/4 { 
		c'16( g' e' e g, c,)
	}	
	e,4( |
 
	\break

 	f)
	<c' a' f' >
	f,( |

  fis)
	<d' a' fis' >
	fis,( |

	g)
	<d' b' g'>
	g, |

	<c, aes'>(
	<ees' c' >
	<c, aes' > |

	<c' aes'>
	<aes, ees'>
	<c' aes'>) |

	g, 
	<d'' b'>(
	<b g'>) |

	\acciaccatura <c, g'>8 e''2		
	r4 |

	<c,, g' e' c'> 
	r2 \bar "||"

	\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.font-size = #-1	
  \mark \markup { \italic "Fine" }

	\break

	\tweak X-offset #-3.5 
	\tweak Y-offset #4
	^\trio

	\bar ".|:-||" 

	b4 
	<g' d' b'>
	<b,> |
	
	ais( b)
	<g' d' b'> |

	gis, e'8( d c b |

	a4) 
	<e' c' a'>(
	<e c'>) |

	a, 
	<f' c' a'>
	a, |
  
	g 
	<b' a'>(
	<b g'>) |

	c8( b a g f e) |

	g,4 
	<e' c' g'>
	g, |

	\break

	gis
	<e' b' gis'>
	gis,( |

	a)
	<e' c' a'>
	a,( |
  
	b)
	<g' d' b'>
	<b,>( |

	cis)
	<a' e' cis'>
	cis, |

	<f' d'>(
	<d, a'>
	<f' d'> |

	<dis, b'>
	<fis' dis'>
	<dis, b'>) |

	\break

	e16 b' gis' e'
	e,, b' gis' f'
	e,, b' gis' e' |

	<f,, c' a' f'>4(
	<c a' f' c'>
	<a f' c' a'>) |

	b
	<g' d' b'>
	b, | \bar ":|."

	\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.font-size = #-1	
	\mark \markup { \italic "D.S. al Fine" }

	\break

}

\header {
	title = "Menuet"
	opus = "Opus 1 Nr.2"
	tagline = "" 
}
\markup {
	\vspace #1
}
\score {

	\new Staff = "violinStaff" \violin 

	\layout {
		indent = 0.0
		#(layout-set-staff-size 22.45)	
		}

	\midi { 
		\tempo 4 = 150
	}

}
\paper {
	top-margin = 10
	system-system-spacing =
		#'((basic-distance . 14) 
    (minimum-distance . 8)
    (padding . 5.5)
    (stretchability . 60)) 
}


%\markup {
%  \line {
%  	hello world
%  }
%}
