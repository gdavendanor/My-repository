   \version "2.12.3"
#(define R rightHandFinger)
#(set-global-staff-size 23.5)
#(set-default-paper-size "letter")
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
\header {
  title = "Pequeña serenata diurna"
  composer = "Silvio Rodríguez"
  instrument = "Guitarra"
  arranger = \markup{\right-column {"Arreglo de W. Luis Mochán" 
  "Transcrito en 2011-01-01" }}
  %  dedication = ""
  tagline = ""
  copyright = \markup{\small 
    "Licenced under Creative Commons Attribution 3.0 Unported License"}
  }

uno = { \FOl r4. <dis-1-\R #3 >8\( <e-1\2>4\) <e -\R#4 >-0 | } %1
dos = { r8 \once\override Voice.NoteHead #'style = #'cross  <e'-4-\R#4 >4 <c,-1-\R#3 >8~ c e-0 c-1 g-0 | } %2 
tres = { r4. <f'-4-\R#3 >8\( e4-4\) <e -\R#4 >-0 }
cuatro = { r8 e4 b8 gis e' b gis | } %4
cinco = { \cejilla "CIII" r4\EC <d'-1-\R#2 bes-1-\R#3 >~<d bes>8 
	  <g-1-\R#4 d bes>4\FC
	  \cejilla "½CII" <g-2 cis,-1 a-1>8\EC~ |}
seis =  {<g cis, a>8 e,-1 a cis g' a, cis g'\FC |}
siete = { \cejilla "½CI" r4\EC <f-1 c-1 a-2 >4~<f c a>8 <f c a>4 <f c a>8~ |} 
ocho = {<f c a>8 a,8 c  f\FC r8 a, c e-0~ |}
nueve = {e4 <d-4-\R#2 a-3-\R#3 >~<d a>8 <d a>4 <e d a>8~ | }
diez = { <e d a>4 <d~-\R#3 a-\R#2 >8 <d gis,~-1-\R#2 >8 gis, 
	 <e-\R#1 > <e'-\R#4 >  <d-\R#2 > | } 
oonce = {<c-1-\R#3 >4 <e-0-\R#4 > <a,-2-\R#2 >8 <b-0-\R#3  > 
	  <c-1-\R#4 > <b-0-\R#3 > |}
doce = {a8-3 b c-2 b a b c d |}
trece = {<e-\R#4 >4-0 <d-4-\R#3 a-2-\R#2 > <c-\R#4 >8-1\( <b >4-0\) 
	  <e-\R#4 >8~-0 |}
catorce = { e4-0 <d-4-\R#3 a-3-\R#2 >4
	    <c-\R#3 >4^\upmordent-\markup{\finger "1-3"}
	    <b-\R#4 -0 gis-1-\R#3 d-0-\R#2 > | }
quince = {<a-\R#3 >4.-3 <e-2-\R#2 >8 <a-\R#3 >-3\( 
	   <gis >-1\) <b-\R#4 >-0 <a-\R#3 >-2 |}
dieciseis = { <c-\R#4 >-1\( <b >-0\) <d-\R#3 >\( <c >\) <e-\R#4 >4 <e b gis> |}
diecisiete = { <e -\R#4  >4-^-0 <e -\R#4  c-1 -\R#3  g-0 -\R#2  >8 <d -\R#3  >-3-^ <c -\R#2 >-^ 
	       <d -\R#3 >4-^ <e -\R#4 >8~-^ | }
dieciocho = {e <e c g>4 <c g e>8~<c g e> <e -\R#3 >-^-0 <a -\R#2 >-^-1 <b -\R#3 >-3-^ | }
diecinueve = { <e, -\R#4 >4-^-0 <e b-0 gis-1>8 <d -\R#3 >-^-3 <c -\R#2 >-^-2 
	       <d -\R#3 >-^-3~<d gis,> <e -\R#4 >-^-0~ |}
veinte = {e <e b gis>4 <b -\R#3  gis -\R#2 >8~<b gis> <b gis>4 <b gis>8~ |}
veintiuno = {r8 <d-1 bes-1> <bes' -\R#4 >-4-^ <a -\R#3 >-^-3 <g -\R#4 >-^-1 <f -\R#3 >4-^-4 
	     <e -\R#4 >8-^-0~ |  }
veintidos = {e8 <e,-2 -\R#1 > <e'-0 -\R#4  cis-3 -\R#3  g-0 -\R#2 >8 <f -\R#2 >-^-1 <g -\R#3 >8-^-4\(
             a8\)  <a -\R#4 >4-^-4 | }
veintitres = {\cejilla "½CI" r8\EC a,8-2 <f'-1 c-1>8 g-^-4 f8-^-1 e-^-0~ <e a,-2> f-^-1~ |  }
veinticuatro = {f a,-2 <e'-0 c-1> f-^-1~f a,-2 <f'-1 c-1> a,\FC | }
veinticinco = {<e' -\R#4 >8-^-0 <a, -\R#2 >-3 <e' -\R#4  d-4 -\R#3  > <d -\R#3 >-^ <c -\R#2 >-^-1 
		<d -\R#3 >4-^ <e -\R#4 >8-^~ | }
veintiseis = {e8 a,~-3 <e' -\R#4  d-4 -\R#3  a -\R#2 > gis,8-1~gis <d' -\R#3 >-^-4 
	      <c -\R#2 >-^-1 <d -\R#3 >-^-4  | }
veintisiete = {<e -\R#4 >8-^-0 <e, -\R#1 >-2~ <e'-0 -\R#4  c-1 -\R#3  g-0 -\R#2  e>8 <d -\R#2 >-^-4
		<c -\R#3 >-^-1 <b -\R#4 >-0-^ <e, -\R#2 > 
		\cejilla "CI" <c' -\R#4 >8-^-1~\EC | }
veintiocho = {c8 <e, -\R#2 >-2 <c'-1 -\R#4  a-3 -\R#3 > e,~\FC e <c' a e> <a -\R#2 >-^-3 
	      <c -\R#3 >-^-1 | }
veintinueve = {<d -\R#4 >4-^-3 <d -\R#3 >8-^ <c -\R#2 >-^-1 <b -\R#3 >-^-0 <a -\R#2 >4-^-2 
		<e' -\R#4 >8-^~-0 | } 
treinta = {e8 <e -\R#4  d-4 -\R#3  a-3 -\R#2 >4 <d -\R#2 >8-^ <c -\R#3 >4-^^\upmordent 
	   <b-0 -\R#4  gis-1 -\R#3  d-0 -\R#2 > | }
treintayuno = {<a -\R#3 >4.-^-2 <e'-0 -\R#4  c-1 -\R#3   a-3 -\R#2 >8 <e, -\R#1 >8-2 a c e }
treintaydos = {\cejilla "½CI" <f -\R#4 >-1\EC <a,-2 -\R#2 > <f' -\R#4  c-1 -\R#3 > a,\FC 
	       <e'-0 b-0 gis-1>2  }
treintaytres = \diecisiete
treintaycuatro = \dieciocho
treintaycinco = \diecinueve
treintayseis = \veinte
treintaysiete = \veintiuno
treintayocho = \veintidos
treintaynueve = \veintitres
cuarenta = \veinticuatro
cuarentayuno = \veinticinco
cuarentaydos = \veintiseis
cuarentaytres = \veintisiete
cuarentaycuatro = \veintiocho
cuarentaycinco = \veintinueve
cuarentayseis = {e4  <e -\R#4  d-4 -\R#3  a>8 <d -\R#3 >-^ <c -\R#2 >-^-1 
		 <d -\R#3 >4-^ <e -\R#4 >8-^~ |}
cuarentaysiete = {e4 <d-4 -\R#4  a-2 -\R#3  f-3 -\R#2 >~<d a f>8 
		  <d a f>4 <d a f>8 |}
cuarentayocho = {cis-3 <e, -\R#1 >-2 <g -\R#2 >-0 <cis -\R#3 > <d -\R#4 >-4 <e, -\R#1 > 
		 <e' -\R#4 >-0 <g, -\R#2 > |}
cuarentaynueve = {\cejilla "½CI" \times 2/3 {r4\EC <f'-1 -\R#4  c-1 -\R#3  a-2 -\R#2 >4\FC 
		  <e -\R#2 >-^-0 } \times 2/3 {<d -\R#3 >-^ <e -\R#4 >4-^  <f -\R#3 >-^~} |}
cincuenta = {f8 <f-1 -\R#4  d-4 -\R#3  a-3 -\R#2 >4 <c' -\R#3 >8-^-4~c <b -\R#2 >4-^-3 
	     <a -\R#3 >8-^-1 |}
cincuentayuno = {<e -\R#4 >4-^-0 <e -\R#4  c-1 g-0 e -\R#1 >8 <d -\R#3 >-^-4 <c -\R#4 >-^-1 
		  <b -\R#3 >-^-0~ <b e,-2 -\R#2 > \cejilla "CI" <c -\R#4 >-^~\EC | }
cincuentaydos = {c-1 <c -\R#4  a-3 -\R#3  e-2 -\R#2 >4 <a e>8~<a e> <c a e>\FC <a -\R#2 >-^ 
		 <c -\R#3 >-^ |}
cincuentaytres = {<d -\R#4 >4-^-3 <d -\R#3  a-2 -\R#2 >8 <c -\R#4 >-^-1 <b -\R#3 >-^ <a -\R#2 >4-^-2
		   <e' -\R#4 >8-^~-0 | }
cincuentaycuatro = {e4  <e -\R#4  d-4 -\R#3  a-2 -\R#2 >8 <d -\R#2 >-^ 
		    <c -\R#3 >4-\markup{\finger "1-3"}^^\upmordent 
		    <b gis d>  |}
cincuentaycinco = {<a -\R#3 >4.-^-3  <e -\R#2 >8-2 <a -\R#3 >-3\( 
		    <gis >-1\) <b -\R#4 >-0 <a -\R#3 >-3 |}
cincuentayseis = {<c -\R#4 >-1\( <b >-0\) <d -\R#3 >-3\( <c >-1\) <e -\R#4 >4-0 
		   <e-0 -\R#4  b-0 -\R#3  gis-1 -\R#2 >~ |}
cincuentaysiete = {<e b gis> \cejilla "½CV" <a-1 -\R#4  e-1 -\R#3  c-1 -\R#2 >2.\EC~ |}
cincuentayocho = {<a e c>1\FC |}

Uno = {  \FOl <a-0-\R #1 >2                       <e-0-\R#1 >            | } %1 
Dos = { a2                        <e'-2-\R#1 >           | } %2 
Tres = { <gis,-1-\R#1 >2                    r8   e4.            | }%3
Cuatro = { <gis-4-\R#1 >2                    e4 gis| } %4
Cinco = { <g-1-\R#1 >2 g |}
Seis = {<a-0> <b-1>4 <cis-3>|}
Siete = { <d-0>2 <a-0> |}
Ocho = {<d-0>2 <c-3> |}
Nueve = { <b-2>2 b }
Diez = { <e-2-\R#1 >2 <e,-0> | }
OOnce = { <a-0>2 <g-4> |}
Doce = {<f-1>2 <e-0> |}
Trece = {<d'-0>2 <c-3> |}
Catorce = {<b-2> <e,-0> |}
Quince = {<a-0>1  |}
Dieciseis = { <d-0>2 r4 <e,-0> |}
Diecisiete = {<a-0-\R#1 >4. <e-0-\R#1 >8 <e-0-\R#1 >2 |}
Dieciocho = {a2 e4 a | }
Diecinueve = {<gis-4>4. e8 e2 |}
Veinte = {gis e4 gis |}
Veintiuno = {\cejilla "CIII"<g-1>2\EC~ g4 g-1\FC |}
Veintidos = {<a-0>1 |}
Veintitres = {d4.-0 a8-0 a2 | }
Veinticuatro = {<d-0 -\R#1 > <c-3> }
Veinticinco = {<b-2>~ b4 b4 }
Veintiseis = {<e -\R#1  >2-2 e, }
Veintisiete = {<a-0> <g-3> }
Veintiocho = {<f-1> e }
Veintinueve = {<d'-0> <c-3> } 
Treinta = {<b-2> e, }
Treintayuno = {<a-0> r }
Treintaydos = {<d-0> <e -\R#1 >8-2 <d -\R#1 >-0 <c -\R#1 >-3 <b -\R#1 >-2  }
Treintaytres = \Diecisiete
Treintaycuatro = \Dieciocho
Treintaycinco = \Diecinueve
Treintayseis = \Veinte
Treintaysiete = \Veintiuno
Treintayocho = \Veintidos
Treintaynueve = \Veintitres
Cuarenta = \Veinticuatro
Cuarentayuno = \Veinticinco
Cuarentaydos = \Veintiseis
Cuarentaytres = \Veintisiete
Cuarentaycuatro = \Veintiocho
Cuarentaycinco = \Veintinueve
Cuarentayseis = {<b-2>2 e,}
Cuarentaysiete = {<bes'-1> bes }
Cuarentayocho = {<a-0>1}
Cuarentaynueve = {<d-0>2 <c-3>}
Cincuenta = {<b-2> r4 e,}
Cincuentayuno = {<a-0>2 <g-3>}
Cincuentaydos = {<f-1> e}
Cincuentaytres = {<d'-0> <c-3>}
Cincuentaycuatro = {<b-2> e, }
Cincuentaycinco = {<a-0>1}
Cincuentayseis = {<d-0>2 r4 e,}
Cincuentaysiete = {<a-0>1~}
Cincuentayocho = {a1}


intro = { \uno \dos \tres \cuatro \cinco \seis \siete \ocho \nueve
	\diez \oonce \doce \trece \catorce \quince \dieciseis} 
melodia	= { \diecisiete \dieciocho \diecinueve \veinte \veintiuno
	\veintidos \veintitres \veinticuatro \veinticinco \veintiseis
	\veintisiete \veintiocho \veintinueve \treinta \treintayuno
	\treintaydos \treintaytres \treintaycuatro \treintaycinco
	\treintayseis \treintaysiete \treintayocho \treintaynueve
	\cuarenta \cuarentayuno \cuarentaydos \cuarentaytres
	\cuarentaycuatro \cuarentaycinco \cuarentayseis
	\cuarentaysiete \cuarentayocho \cuarentaynueve \cincuenta
	\cincuentayuno \cincuentaydos \cincuentaytres
	\cincuentaycuatro \cincuentaycinco \cincuentayseis
	\cincuentaysiete \cincuentayocho
	}

introB =  { \Uno \Dos \Tres \Cuatro \Cinco \Seis \Siete \Ocho \Nueve \Diez
     \OOnce \Doce \Trece \Catorce \Quince \Dieciseis }
melodiaB = { \Diecisiete
	     \Dieciocho \Diecinueve \Veinte \Veintiuno \Veintidos
	     \Veintitres \Veinticuatro \Veinticinco \Veintiseis
	     \Veintisiete \Veintiocho \Veintinueve \Treinta \Treintayuno
	     \Treintaydos \Treintaytres \Treintaycuatro \Treintaycinco
	     \Treintayseis \Treintaysiete \Treintayocho \Treintaynueve 
	     \Cuarenta \Cuarentayuno
	     \Cuarentaydos \Cuarentaytres \Cuarentaycuatro \Cuarentaycinco
	     \Cuarentayseis \Cuarentaysiete \Cuarentayocho
	     \Cuarentaynueve  \Cincuenta 	\Cincuentayuno \Cincuentaydos
	     \Cincuentaytres	\Cincuentaycuatro \Cincuentaycinco
	     \Cincuentayseis	\Cincuentaysiete \Cincuentayocho
	     } 


\score {
  \new Staff {
    \time 4/4
    \clef "treble_8"
    \key a \minor
    \tempo 4=140
    \set Staff.instrumentName = #"Guit."
    \set Staff.midiInstrument = #"Acoustic Guitar (nylon)"

    << 
      \override Staff.TextScript
      #'(fret-diagram-details finger-code) = #'below-string
      
      \new Voice = "melodia" \relative c' {
	\voiceOne
				%      #(override-auto-beam-setting '(end * * 4 4) 1 4)
				%      #(override-auto-beam-setting '(end * * 4 4) 2 4)
				%      #(override-auto-beam-setting '(end * * 4 4) 3 4)
	\override StrokeFinger #'avoid-slur = #'around
	\intro \bar "||" \melodia \bar "|."
      }
      \new Voice = "bajo" \relative c {
	\voiceTwo
	\introB \melodiaB
      }
      
    >>
  }
  \midi {
    \context {
      \Score
      midiMinimumVolume = #1.0
    }
  }
  \layout{}
}
\paper {
  print-page-numer = ##t
  print-first-page-number = ##t
  bottom-margin = 2.0\cm
  top-margin = 2.0\cm
%  right-margin = 4.0\cm
%  left-margin = 2.0\cm
}

