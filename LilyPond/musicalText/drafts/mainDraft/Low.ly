\version "2.20.0"

Low = \relative c, {
	ges4 ges r8 ges r aes( | aes2) r8 aes4. | 
	f4 f r8 aes r bes( | bes1) | 

}
\score {
		\new TabStaff \with {
			stringTunings = #bass-tuning 
		} {
			\Low 	
		}
	\layout { }
	\midi { 
		\tempo 4 = 100
	}
}
