\include "../tricks.ly"

\header {
  title = "Blame it on the Boogie"
}

intr = \relative c''' { 
  r8 c8-^ r4 r2
  r8 a-> r4 r8. a,16 r4
  r16 c'-. a-. g-. a-. c-. a-. c-. r4 r16 b8. 
  \bar "||"
  c4-^
}

vers = \relative c''' {
   r4^"Vers" r2 R1*2 
  <a c d>8. q16 r8 <e g c>8~q4 r
  R1*3
  <g b d>8.-> q16-> r8 q->~ q4 r4
}

omkv = \relative c''' \repeat volta 2 {
  r4^"Omkv." r16 g-- a8-. <g c e>16-- q-. r8 r4 
  r1
  r4. <as bes d>8-> r q-> r4
  r4. <e g c>8^^ r2
}

versII = \relative c''' {
  r1^Vers r1
  r2 r16 g16-. a8-. c-. d-.
  <g, c e>4->~ q16 <e g c>8.->~ q4 r
  r1
  r2. <e g c>16 q-^ r8
  r1
  <g b d>8.-- q16-^  r8 q->~ q4 r
}

versIII = \relative c''' {
   r4^"Vers" r2 r1
  r2 r16 g16-. a8-. c-. d-.
  <g, c e>4->~ q16 <e g c>8.->~ q4 r
  r1
  r2. <e g c>16 q-^ r8
  r1
  <g b d>8.-- q16-^  r8 q->~ q4 r
}

cstk = \relative c' \repeat volta 2 {
  r1^"C-stk." r2 r8 <f b d>-> r16 q8.->
  r1 r2 r8 <f b d>[-> r8 q8]->
}

fin = {c'''4}

Song = \transpose c g, { 
  \compressRests
  <<
  {R1*5 \intr}
  {s1*7 s8 s4^\markup\eyeglasses }
  >>
  \vers
  \omkv
  \versII
  \omkv
  \cstk
  \omkv
  r1 \intr
  \versIII
  \omkv
  R1*8
  \omkv
  r1 \intr
  \bar "|."
}

\book {
  \bookOutputSuffix "eb"
  \header {
    subtitle = \ebInstr
  }
  \Song
}

SongBb = \transpose c g, { 
  \compressRests
  <<
  {R1*5 \intr}
  {s1*7 s8 s4^\markup\eyeglasses }
  >>
  \transpose c c, \vers
  \transpose c c, \omkv
  \transpose c c, \versII
  \transpose c c, \omkv
  \cstk
  \transpose c c, \omkv
  r1 \intr
  \transpose c c, \versIII
  \transpose c c, \omkv
  R1*8
  \transpose c c, \omkv
  r1 \intr
  \bar "|."
}

\book {
  \bookOutputSuffix "bb"
  \header {
    subtitle = \bbInstr
  }
  \transpose bes es' \SongBb
}
