\version "2.20.0"

Low = \relative c, {

	ges4 ges r8 ges r aes~( | aes2) r8 aes4. | 
	f4 f r8 aes r bes\4~( | bes1\4) | 
	\break
	r4 des r8 des r4 | r4 des r8 des r4 | 
	r4 des r8 des r4 | r4 des r8 aes4. |

}
\header {
	tagline = ""
}
\score {
		\new TabStaff \with {
			stringTunings = #bass-tuning 
			\clef moderntab
		} {
			\Low 	
		}
	\layout { }
	\midi { 
		\tempo 4 = 117
	}
}
