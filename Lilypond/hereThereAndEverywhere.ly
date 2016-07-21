\version "2.12.3"
#(define R rightHandFinger)
#(set-global-staff-size 22)
#(set-default-paper-size "letter")
P = #(define-music-function  (parser location) ()
    #{ 
      \rightHandFinger  #1 %no funciona!! 
      #} )
cejilla = #(define-music-function (parser location sim)(string?)
	    #{
		 \override TextSpanner #'(bound-details left text) =
		 \markup {\general-align #Y #CENTER { $sim }}
		 \override TextSpanner #'(bound-details right text) =
		 \markup{\concat{\draw-line #'(1 . 0)\draw-line #'(0 . -1)}}
		 \override TextSpanner #'style = #'solid
	    #}
	    )
EC = \startTextSpan
FC = \stopTextSpan
FOl =  \set fingeringOrientations = #'(left) 
SEP =  \once\override NoteHead #'extra-spacing-width = #'(-1 . 0)
%^\markup\fret-diagram-terse  = #(define-music-function (parser location musica acorde) 
%       (ly:music? string?)
%       #{
%       $musica^\markup{ \fret-diagram-terse #$acorde }
%       #}
%     )
\header {
  title = "Here, there, and everywhere"
  composer = "John Lennon and Paul McCartney"
  instrument = "Guitarra"
  arranger = "Arreglo de W. Luis Mochán"
  }

{
  \time 4/4
  \clef "treble_8"
  \key a \major
  \set Staff.instrumentName = #"Guit."
%  <<\voiceOneStyle\\ \voiceTwoStyle\\ \voiceThreeStyle\\ \voiceFourStyle
%  >>
  << 
    \override Staff.TextScript
    #'(fret-diagram-details finger-code) = #'below-string

    \FOl
    \cejilla "CIV"
    \relative c { s8 ^\markup\fret-diagram-terse  #"x;o;2-2;2-3;2-4;o;"
		  <e-2-\R #2 >8-^ <a-3-\R #3 >-^ <cis-4-\R #4 >-^
		   <e-2 >-^\EC ^\markup\fret-diagram-terse 
		  #"4-(;4;6-3;6-4;5-2;4-);"
		  <e-\R #3 >-^ <e-\R #4 >4-^\FC }   \\
    \FOl
    \relative c {\stemNeutral <e-2 a-3 cis-4 e-0>8\arpeggio s4.
		 \stemDown <gis-3 cis-4>2\arpeggio  }\\
    \FOl \\
    \FOl
    \relative c { <a-0-\R #1 >2 <cis-1-\R#1 > }
  >>
  | %2-
  <<
    \time 3/4
    \relative c' 
    {s8 ^\markup\fret-diagram-terse  #"x;3-3;2-2;o;1-1;o;"
     <g-\R #2 >8-^ <c-\R #3 >-^ <e-\R #4 >-^ 
     \override Script #'padding = #2.0 %para evitar colisiones con marcato
     \times 2/3 { <g-4-\R #3 >-^[ <f-\R#4 -1 >-^  <e-0-\R#3 >-^] } }
    \\
    \relative c {\stemNeutral <e-2 g-0 c-1 e-0>8\arpeggio }\\
    \\
    \relative c { <c-3-\R #1 >2. }
  >>
  %3
  <<
    \revert Script #'padding 
    \time 4/4
    \relative c {<b-2 e-3 a-4 b-0 e-0>8\arpeggio
    	          ^\markup\fret-diagram-terse  #"o;2-2;2-3;2-4;o;o;"
		  <a'-\R#2 > <b-\R#3 > 
		  <e-\R#4 > ^\markup\fret-diagram-terse  #"o;2-2;o;1-1;3-4;o;"
		  <gis,-\R#2 > <d-\R#1 > <e'-\R#4 > 
		  <d-4-\R#3 >}  \\
    \\
    \\
    \FOl
    \relative c, {<e-0-\R#1 >2 <e-\R#1 >2}
  >>
  | %4
  \repeat volta 2 {
  <<
    \relative c'{<a-3-\R#3 >2-^ ^\markup\fret-diagram-terse  #"x;o;2-2;2-3;2-4;o;"
		  s2} \\
    \FOl
    \stemNeutral
    \relative c{ s8 <e-2-\R#2 > <cis'-4-\R#4 > <a-3-\R#3 >
		 <fis-2-\R#2 > ^\markup\fret-diagram-terse  #"x;x;4-2;4-3;3-1;x;"
		 <d'-1-\R#4 > <b-3-\R#3 > <fis-2-\R#2 >} \\
    \\
    \relative c{<a-0-\R#1 >2 r2 }
  >>
  | %5
    <<
    \relative c' {\mark\markup{ \musicglyph #"scripts.segno" } 
		  <cis-3-\R#2 >8-^ 
		   ^\markup\fret-diagram-terse   #"x;x;x;6-3;5-1;7-4;"
		   <e-1-\R#3 >-^ <b'-4-\R#4 >-^ 
		   <a-1-\R#3 >-^~ a <d,-2-\R#2 >-^ ^\markup\fret-diagram-terse  #"x;x;x;7-2;7-3;5-1;"
		   <fis-3-\R#3 >-^ 
		   <e-0-\R#4 >~-^}  \\ 
    \\
    \\
    \relative c, {r2 <e-0-\R#1 >2}
  >>
  | %6
  <<
    \relative c' {e2} \\
    \FOl
    \stemNeutral
    \relative c' {a8\rest <e-2-\R#2 >8 ^\markup\fret-diagram-terse  #"x;o;2-2;1-1;2-3;o;"
		  <aes-1-\R#3 cis-3-\R#4 > <e-2-\R#2 >
		 \cejilla#"CII"
		 fis8\rest\EC ^\markup\fret-diagram-terse  #"x;2-(;4-3;2;3-2;2-);"
		 <fis-3-\R#2 > <a-1-\R#3 d-2-\R#4 > <fis-3-\R#2 >\FC
	       }  \\
    \\
    \relative c {<a-0-\R#1 >2 
		  <b-1-\R#1 >} 
  >>
  | %7
  << 
    \FOl
    \relative c' {
      \override StrokeFinger #'avoid-slur = #'around
      \cejilla "CIV"
      <cis-4-\R#3 >8\(\EC ^\markup\fret-diagram-terse  #"x;4-1-(;6-3;6-4;5-2;4-1-);"
		      <d-4 >\) 
      <e-2-\R#4 >-^ <fis-4-\R#3 >-^\FC~fis <a,-1\3-\R#2 >-^ 
      <b-0-\R#3 >-^  <cis-1-\R#4 >-^~} \\
    \relative c'{<gis-3-\R#2 >2}\\
    \\
    \relative c {<cis-1-\R#1 >2 <d-0-\R#1 > ^\markup\fret-diagram-terse  #"x;x;o;2-1;o;x;"}
  >>
  | %8
  <<
    \relative c' {cis8 <cis-1-\R#4 > <cis-\R#3 >-^ <cis-\R#4 >-^~cis2}\\
    \FOl
    \relative c {fis8\rest 
		 %\once \override NoteColumn #'force-hshift = #1
		 <fis-3-\R#2 b-4-\R#3 >4. fis8\rest <eis-2-\R#2 >8 
		 <b'-4-\R#3 cis-\R#4 > <eis,-2-\R#2 >}\\
    \\
    \relative c {<gis-2-\R#1 >2 ^\markup\fret-diagram-terse  #"4-2;x;4-3;4-4;2-1;x;"
		  <cis-3-\R#1 > ^\markup\fret-diagram-terse  #"x;4-3;3-2;4-4;2-1;x;"
		}
  >>
  | %9
  <<
    \relative c' {<cis-1-\R#4 >8\( <d-1 >\) <cis-1-\R#3 >-^ 
		   <cis-\R#4 >-^~cis4. <b-0-\R#3 >8-^}\\
    \relative c {<fis-3-\R#2 b-4-\R#3 >2 fis8\rest <eis-2-\R#2 >8 
		  <b'-4-\R#3 cis-\R#4 > s8}\\
    \\
    \relative c {<gis-2-\R#1 >2 ^\markup\fret-diagram-terse  #"4-2;x;4-3;4-3;2-1;x;"
		  <cis-3-\R#1 > ^\markup\fret-diagram-terse  #"x;4-3;3-2;4-4;2-1 o;x;"
		}
  >>
  | %10
  <<
    \cejilla #"CII"
    \relative c' { <a-\R#3 >8\(\EC <b-3 >\) <cis-1-\R#3 >-^ 
		   <gis'-4-\R#4 >-^~gis4 
		   <fis-\R#4 >8\FC <b,-0-\R#2 >-^~
			    }  \\
    \relative c {<e >2 a8\rest <a-\R#2 > <d-2-\R#3 >4 } \\
    \\
    \relative c, {<fis-\R#1 >2 ^\markup\fret-diagram-terse  #"2-1-(;x;2;2;2;2-1-) 4-4;"
		   <b-\R#1 > ^\markup\fret-diagram-terse  #"x;2-1-(;x;2;3-2;2-);"
		 }
  >>
  | %11
}
  \alternative {
    {
      <<
	\mark\markup{\musicglyph #"scripts.coda" }
	\relative c' {<b >2-^ r2} \\
	\relative c {
	  f8\rest
	   <a-3-\R#2 >8 <fis'-4-\R#4 > <b,-\R#3 >~ b <a-2-\R#2 > 
	  <gis-1-\R#3 > <e-2-\R#2 > } \\
	\\
	\relative c { <b-2-\R#1 >2 ^\markup\fret-diagram-terse  #"x;2-2;x;2-3;o;2-4;"
		      <e,-0-\R#1 >}
      >>
    }
    % 12
    {
      <<
	\relative c' {<b >2-^\repeatTie } \\
	\relative c {f8\rest <a-3-\R#2 >8 <fis'-4-\R#4 > <b,>} \\
	\\
	\relative c { <b-2-\R#1 >2 ^\markup\fret-diagram-terse  #"x;2-2;x;2-3;o;2-4;"}
      >>
      \key c \major
      <<
	\cejilla #"CI"
	\relative c' { b8\rest <b-0-\R#3 >8 <c-1-\R#3 >\EC <d-4-\R#4 >-^\FC} \\
	\relative c' { s8 \SEP <gis-1-\R#2 > <a-2-\R#2 >} \\
	\\
	\relative c, { <e-0-\R#1 >4 ^\markup\fret-diagram-terse  #"o;x;x;1-1;o;x;"
		       <f-1-\R#1 > ^\markup\fret-diagram-terse  #"1-1-(;x;x;2-2;1-);x;" }
      >>
    }
  }
  %13
  <<
    \relative c' {<e-0-\R#4 >8-^ <g-4-\R#3 >-^ <e-0-\R#4 >4-^ 
		   s4 <d-4-\R#2 >8-^ <c-1-\R#3 >-^}\\
    \relative c'{\FOl 
		 <g-0 b-0>4. <g>8~g <e-\R#1 g-\R#2 c-\R#3 e-\R#4 >4.\arpeggio
		} \\
    \\
    \relative c{<c-3-\R#1 >2 ^\markup\fret-diagram-terse  #"x;3-3;x;o;o;o;"
		 <a-0-\R#1 > ^\markup\fret-diagram-terse  #"x;o;2-2;o;1;o;"}
  >>
  %14
  <<
    \relative c' {<d-4-\R#4 >8 <e-0-\R#3 >-^ <f-1-\R#4 >-^ <d-4-\R#3 >-^ 
		   <b-0-\R#4 > <b-\R#3 >-^ 
		   <c-2-\R#2 >-^ <d-4-\R#3 >-^ } \\ 
    \FOl
    \relative c { <f-3-\R#2 a-2-\R#3 >2 <d-0-\R#1 gis-1-\R#2 >} \\
    \\
    \relative c {<b-1-\R#1 >2 ^\markup\fret-diagram-terse  #"x;2-1;3-3;2-2;3-4;o;"
		  <e,-0-\R#1 > ^\markup\fret-diagram-terse  #"o;x;o;1-1;o;x;"} \\
  >>
  %15
  <<
    \relative c' {<e-0-\R#4 >8 <c-1-\R#3 >8-^ <a-3-\R#2 >4-^  } \\
    \relative c {<e-2-\R#1 g-0-\R#2 c-1-\R#3 >2\arpeggio
		  s8 <a-\R#2 > <c-\R#3 e-\R#4 > 
		  <a-\R#2 > } \\
    \\
    \relative c {<a-0-\R#1 >4. ^\markup\fret-diagram-terse  #"x;o;2-2;o;1-1;o;" 
		  <a>8 <g-4-\R#1 >4 ^\markup\fret-diagram-terse  #"4-4;x;x;2-2;1-1;o;" } \\
  >>
  %16
  <<
    \FOl
    \cejilla "CI"
    \relative c' {<d-4-\R#4 >8 <e-0-\R#3 >-^ <f-1-\R#4 >-^\EC <d-4-\R#3 >-^\FC 
		   <b-0-\R#4 > <b-\R#3 >-^ <c-2-\R#2 >-^ <d-4-\R#3 >-^  } \\
    \relative c {<f-3-\R#2 a-2-\R#3 >2 <d-0-\R#2 gis-1-\R#3 > } \\
    \\
    \FOl
    \relative c, {<f-1-\R#1 >2 ^\markup\fret-diagram-terse  #"1-1;x;3-3;2-2;3-4;o;"
		   <e-0-\R#1 >2 ^\markup\fret-diagram-terse  #"o;x;o;1-1;o;x;" } \\
  >>
  %17
  \key a \major
  <<
    \relative c'{<e-0-\R#4 >4-^ <cis-4-\R#4 >8-^ <a-3-\R#3 >-^} \\
    \relative c{ e8\rest <e-2-\R#2 >4. 
		 <fis-2-\R#2 >8
		 <d'-1-\R#4 > <b-3-\R#3 > <fis-2-\R#2 >
		 ^\markup{\hspace #-10 \bold\italic "D.S. al Coda"  }
	       } \\
    \\
    \relative c{<a-0-\R#1 >2 ^\markup\fret-diagram-terse  #"x;o;2-2;2-3;2-4;x;" 
		 r2 ^\markup\fret-diagram-terse  #"x;x;4-2;4-3;3-1;x;" }
  >>
  \bar "||"
  %18
  <<
    \FOl
    \mark\markup{\musicglyph #"scripts.coda"}
    \relative c' {<b-0-\R#3 >2-^\repeatTie 
		   b8\rest <b-\R#4 > <a-\R#2 >-^ <gis-1-\R#4 >-^} \\
    \relative c {
      f8\rest <a-3-\R#2 >8 <fis'-4-\R#4 > <a,-\R#2 > s <a-\R#3 >8 c,4\rest 
		} \\
    \\
    \relative c { <b-2-\R#1 >2 ^\markup\fret-diagram-terse  #"x;2-2;x;2-3;o;2-4;"
		  <e,-0-\R#1 > ^\markup\fret-diagram-terse  #"o;x;x;2-3;o;x;" }
  >>
  %19
  <<
    \cejilla #"CII"
    \relative c' {<a-3-\R#3 >2-^ <a-1-\R#3 >4.-^\EC <cis-1-\R#2 >8-^\FC } \\
    \relative c {e8\rest <e-2-\R#2 > <cis'-4-\R#4 > <e,-\R#2 >  e8\rest 
		 <fis-3-\R#2 > <a-1-\R#3 d-2-\R#4 >8 s8} \\
    \\
    \relative c {<a-0-\R#1 >2 ^\markup\fret-diagram-terse  #"x;o;2-2;2-3;2-4;x;"
		  <b-1-\R#1 > ^\markup\fret-diagram-terse  #"x;2-1-(;4-3;2-1;3-2;2-1-);"} \\
  >>
  %20
  <<
    \relative c' {<e-2-\R#4 >4-^ <cis-4-\R#3 >8-^ <a-1\3-\R#2 >8-^~a2} \\
    \relative c' {gis8\rest <gis-3-\R#2 >4. s8 \SEP <a-1-\R#2 > 
		  <d-3-\R#3 fis-2-\R#4 > <a-\R#2 >} \\
    \\
    \relative c {<cis-1-\R#1 >2 ^\markup\fret-diagram-terse  #"x;4-1;6-3;6-4;5-2;x;"
		  <d-0-\R#1 > ^\markup\fret-diagram-terse  #"x;x;o;2-1;3-3;2-1;"} \\
  >>
  %21
  <<
    \cejilla #"CII"
    \relative c' {<a-3-\R#3 >2-^ <a-1\R#3 >4.-^\EC <cis-1-\R#2 >8-^\FC } \\
    \relative c {d8\rest <e-2-\R#2 > <cis'-4-\R#4 > <e,>  e8\rest
		 <fis-3-\R#2 > <a-1-\R#3 d-2-\R#4 >4} \\
    \\
    \relative c {<a-0-\R#1 >2 ^\markup\fret-diagram-terse  #"x;o;2-2;2-3;2-4;x;"
		  <b-1-\R#1 >  ^\markup\fret-diagram-terse  #"x;2-1-(;4-3;2-1;3-2;2-1-);" } \\
  >>
  %22
  <<
    \relative c' {<e-2-\R#4 >4-^ <b'-4-\R#4 >8-^  <a-1-\R#3 >8-^ ~a2 } \\
    \relative c' {gis8\rest <gis-3-\R#2 >4. s2  } \\
    \\
    \relative c {<cis-1-\R#1 >2 ^\markup\fret-diagram-terse  #"x;4-1;6-3;x;5-2;7-4;"
		  <d-0-\R#1 cis'-2-\R#2 fis-3-\R#3 >8 ^\markup\fret-diagram-terse  #"x;x;o;6-2;7-3;5-1;"
		  <cis-1-\R#1 b'-2-\R#2 e-3-\R#3 > ^\markup\fret-diagram-terse  #"x;4-1;x;4-2;5-3;x;"
		  <b-1-\R#1 a'-2-\R#2 d-3-\R#3 > ^\markup\fret-diagram-terse  #"x;2-1;x;2-2;3-3;x;"
		  \cejilla "CV"
		  <a-1-\R#1 e'-4 gis-2 cis-3 e-1 a-1 >~\EC\arpeggio 
		  ^\markup\fret-diagram-terse  #"5-1-(;7-4;6-2;6-3;5-1;5-1-);"} \\
  >>
  %23
  <<
    \\
    \\
    \\
    \relative c {<a e' gis cis e a >1\FC }
  >>
  \bar "|."
}

\paper {
  print-page-numer = ##t
  print-first-page-number = ##t
  bottom-margin = 2.0\cm
  top-margin = 2.0\cm
%  right-margin = 4.0\cm
%  left-margin = 2.0\cm
}