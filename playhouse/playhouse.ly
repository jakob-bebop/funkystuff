\version "2.16"

\header {
  title = "I'm Gonna Tear Your Playhouse Down"
  composer = "Ann Peebles, Don Bryant (1973)"
  %opus = "1973"
}

%{
You think you've got it all set up
You think you've got the perfect plan
To charm every girl you see
And play with anyone that you can

But I've got news for you
I hope it won't hit you too hard
One of these days while you're at play
I'm gonna catch you off guard

I'm gonna tear your playhouse down pretty soon
I'm gonna tear your playhouse down room by room

You think love is just fun and games
Trying to be a playboy
All you do is run around
Using hearts for playtoy

You've been playing daddy with every mama around
What you gonna say when you look up one day
And see your playhouse tumbling down?

I'm gonna tear your playhouse down pretty soon
I'm gonna tear your playhouse down room by room

I'm gonna tear your playhouse down pretty soon
I'm gonna tear your playhouse down room by room
Yeah, yeah, pretty soon
I'm gonna tear your playhouse down room by room
%}

mærker = {
  \mark "Intro"
  s1*4 
  \mark "Vers"
  s1*16
  \mark "Omkvæd"
  s1*8 
  \mark "Interlude"
  s1*8 
}

akkorder = \chordmode {
  \repeat unfold 2 { g1:m c:m }
  \repeat unfold 4 { g1:m c:m }
  d:m c:m d:m c:m
  f es es f
  
  \repeat unfold 4 { c:m g:m }
  
  c:m s as s c:m s d:m s
  
}

blæs = \relative c'' {
  R1
  r4 bes8 g bes4 c d1
  r4 bes8 g bes4 c 
  \bar "||"
  g1
  R1*7
  
  <<
    {f'1 es d es     c  bes   es \new Voice{\voiceOne d8 c~  c2.}  } 
    {a1 g a g       a  g     g   \voiceTwo a }
  >>
  \oneVoice
  \bar "||"
  \repeat unfold 2 << 
		{
			R1
			r8 d-. f-. g~-> g f16 d f8-> g-.
			R1*2
		}
		{
			R1
			r8 g, a bes~ bes a16 g a8 bes
		}
	>>

        
        \bar "||"
      r4 bes (g8 es g a) bes-. bes4-- g8~g4 r4 
      r4 c (as8 es as bes) c-. c4-- as8~ as4 r4
      r4 d (bes8 g bes c)  d-. d4-- bes8~ bes4 r4
      << { < c a >1~ q } { s2*3-\< s2\!} >>
}

strygerstemme = \relative c'' {
  d2~ d4. c8~ c2. r8 f16 es
  d2~ d4. c8~ c4 bes8 g bes4 c 
  g1 R1*7
  r4 f a f g es c c' a bes c d c bes a g 
  f1 es g r4 g a bes 
  d4 ( c8 bes c4 bes8 g bes2. c4
  d4. c8~ c2 )
  r4 g (f' es)
  d4. (c8~ c4. bes8~ bes4. a8~ a4. g8~ g2 f2~
  f4) r g8 a bes c
  d1~ d2. r8 c16 d 
  c1~ c2 r4 bes8 c 
  d1~ d2. r8 bes16 d 
  c1~ c1
}


\score {
  <<          

    
    \new ChordNames \akkorder
    \new Staff 
    \with { instrumentName = #"Blæsere" shortInstrumentName = #"bl"}
    <<  \blæs \mærker >>
    \new Staff 
    \with { instrumentName = #"Strygere" shortInstrumentName = #"st"}
    {\strygerstemme}
  >>
}
 %{
\layout {
\context {
  \Score 
    \override NonMusicalPaperColumn #'line-break-system-details =
            #'((X-offset . 0)
     (Y-offset . 100)
     (alignment-distances . (15)))

  }
}
 %}

\paper {
  system-system-spacing #'padding = #8
}