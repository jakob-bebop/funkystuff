\version "2.13"
\include "../tricks.ly"
omkBeg= \relative c'' { \repeat unfold 2 { r8 e8. (c32 b a4) r8 } }
omkSlut = \relative c' { < e g c >4 r8 r4. r2. }
versEt = \relative e'' { r4. e d2. d c }
versTo = \relative c' { < c' g e >8 q q q q q < b g d > q q q q q <bes f d> q q q q q <a f c> q q q q q }
versSlutn = \relative c'' \repeat percent 4  { < a f d >4. < b g d > }
bstk = \relative c' { < e c g >2.  (< d bes f >) < e c g > (< d bes f >) < e c a > (< es bes g >) < e c a >4. < f c a > q < g d b > }

omk = { \omkBeg \transpose c c' \omkSlut }

alt = \transpose c bes {
	\key c \major
	\compressRests
	\time 6/8
	\mark "Vers 1" R2.*4 \transpose c' c \versEt R2.*4 \bar "||" \break
	\mark "Omkvæd" \transpose c' c \omk \bar "||" \break
	\mark "Vers 2" \versTo \break \transpose c' c \versEt \versSlutn \bar "||" \break
	\mark "Omkvæd" \transpose c' c \omk \bar "||" \break
	\mark "B" \bstk \break
	\mark "Omkvæd" \transpose c' c \omk \bar "||" \break
}

omk = { \omkBeg \omkSlut }

tenor = \transpose c bes {
	\key c \major
	\compressRests
	\time 6/8
	\mark "Vers 1" R2.*4 \versEt R2.*4 \bar "||" \break
	\mark "Omkvæd" \omk \bar "||" \break
	\mark "Vers 2" \versTo \break \versEt \versSlutn \bar "||" \break
	\mark "Omkvæd" \omk \bar "||" \break
	\mark "B" \transpose c c' \bstk \break 
	\mark "Omkvæd" \omk \bar "||" \break
}
\header {
   title = "Natural Woman"
	 meter = Flødesuppe
}
\book{
	\bookOutputSuffix "bb"
	\header {
		instrument = "Bb blæs"
	}
	\transpose bes c { \tenor }
}
\book {
	\bookOutputSuffix "eb"
	\header {
		instrument = "Eb blæs"
	}
	\transpose es c { \alt}
}
