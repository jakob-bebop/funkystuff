\version "2.13"

\include "../tricks.ly"

Break = { < g'' d'' gis' e' >16 q q q~-^ q q8-^ q16-^ r2 }
Riff = \relative c' { \bar "" 
	\once \override Score.TimeSignature #'stencil = ##f
	\time 1/16
	fis16 
	\once \override Score.TimeSignature #'stencil = ##f
	\time 4/4
	\mark B
	\repeatVoltaNoAlt #4 { < gis e b >8-. < b gis d >~ < b gis d >8. < cis gis e >16~^^ < cis gis e > < b gis e >8.~ < b gis e > < fis d a >16 | < gis e b > < b gis d > < b gis d > < gis e b > < b fis d >8^^ r8 r4..
		\parenthesize fis16 %-\tweak #'self-alignment-X #0 _"(ikke sidste ×)" 
} }
bb = \bar "||"

VersFire = \relative c'' \repeatVoltaNoAlt #4 { a4 r < c a >16 <b g> <c a>8 r <es c>16 <d b> | <c a>4 r r2 }

