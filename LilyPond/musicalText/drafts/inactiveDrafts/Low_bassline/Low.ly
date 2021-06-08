\version "2.20.0"

LowMain = \relative c, {

	ges4 ges r8 ges r aes( | aes2) r8 aes4. | 
	f4 f r8 aes r bes\4( | bes1\4) :|| 
	\break
}
LowTurnaround = \relative c, {
	r4 des r8 des r4 | r4 des r8 des r4 | 
	r4 des r8 des r4 | r4 des r8 aes4. |
	\break
}
\header {
	title = "Crane Song - Low" 
	subtitle = "Bassline"
	composer = "M.H. Wine"
	tagline = ""
}
\markup {
	\vspace #1
}
\markup {
	Verse / Chorus
}

\paper {
	top-margin = 20
	system-system-spacing = #'((basic-distance . 20) (padding . 10))
}		
\score {
	\new TabStaff \with {
		stringTunings = #bass-tuning 
		\clef moderntab
	} {
		\LowMain
	}
	\layout {
		indent = #0 
		\context {
			\Score	
			\omit BarNumber
		}
	}
	\midi { 
		\tempo 4 = 117
	}
}
\markup {
		Verse ( \italic {intro} ) / Pre-Chorus 
}
\score {
	\new TabStaff \with {
		stringTunings = #bass-tuning 
		\clef moderntab
	} {
		\LowTurnaround 
	}
	\layout {
		indent = #0 
		\context {
			\Score	
			\omit BarNumber
		}
	}
	\midi { 
		\tempo 4 = 117
	}
}
