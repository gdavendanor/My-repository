\version "2.12.3"
#(define R rightHandFinger)
#(set-global-staff-size 19)
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
  title = "Romanza"
  composer = "Anónimo"
  instrument = "Guitarra"
  arranger = "Según enseñó Filemón Montaño a W. Luis Mochán ca. 1968"
%  dedication = "para David"
  }

notas = { 
  \mark\markup{ \musicglyph #"scripts.segno" }
  \FOl
  \repeat volta 2 {
    \key e \minor
     #(override-auto-beam-setting '(end * * 3 4) 1 4)
     #(override-auto-beam-setting '(end * * 3 4) 2 4)
    \times 2/3{<e,-4-\R #1  b'-\R #4 >8^^ 
	 <b-\R #3 > <g-\R #2 >} \times 2/3{b'^^ b g} \times 2/3{b'^^ b g} | %2
    \times 2/3{<e, b'>8^^ b g} \times 2/3{a'-2 ^^ b g} \times 2/3{g'-2 ^^ b g} | %3
    \times 2/3{<e, g'>^^ b g} \times 2/3{fis'-1^^ b g} \times 2/3{e'^^ b g} | %4
    \times 2/3{<e, e'>^^ b g} \times 2/3{g'-1^^ b g} \times 2/3{b'-4^^ b g} | %5
    \times 2/3{<e, e''-4>^^ b g} \times 2/3{e''^^ b g} \times 2/3{e''^^ b g} | %6
    \times 2/3{<e, e''>^^ b g} \times 2/3{d''-2^^ b g} \times 2/3{c''-1^^ b g} | %7
    \cejilla "½CV"
    \times 2/3{<a, c''-4>\EC^^ e'-1\2 c'-1\3} \times 2/3{b'^^-3 e'\2 c'\3} \times 2/3{a'-1^^ e'\2 c'\3} | %8
    \times 2/3{<a, a'-1>^^ e'\2 c'\3} \times 2/3{b'-3^^ e'\2 c'\3} \times 2/3{c''-4^^ e'\2 c'\3\FC} | %9
    \set TabStaff.minimumFret = #7
    \cejilla "CVII"
    \times 2/3{<b,-1 b'-1>\EC^^ fis'-1 dis'-2} \times 2/3{c''^^-3 fis' dis'} \times 2/3{b'^^-1 fis' dis'} | %10
    \times 2/3{<b, dis''-4>^^ fis' dis'} \times 2/3{c''-3^^ fis' dis'} \times 2/3{b'-1^^ fis' dis'\FC} | %11
    \set TabStaff.minimumFret = #0
    \times 2/3{<e,-0 b'-4>8^^ b_0 g-0} \times 2/3{a'-2^^ b g} \times 2/3{g'-2^^ b g} | %12
    \times 2/3{<e, g'>^^ b g} \times 2/3{fis'-1^^ b g} \times 2/3{e'-0^^ b g} | %13
    \times 2/3{<b,-2 fis'-4>^^ b a-3} \times 2/3{fis'^^ b a} \times 2/3{fis'^^ b a} | %14
    \times 2/3{<dis-1 fis'>^^ b a} \times 2/3{g'-4^^ b a} \times 2/3{fis'-4^^ b a} | %15
    \times 2/3{<e-3 e'-0>^^ b g} \times 2/3{<b,-2 e'>^^ b g} \times 2/3{<g,-4 e'>^^ b g} | %16
    <e, b,-2 e-3 g b e'>2.\arpeggio^\markup{\hspace #4 \italic\bold "fine"} | %17
  }
  \repeat volta 2 {
    \key e \major
    \times 2/3{<e,-0 gis'^4>8^^ b_0 gis-1} \times 2/3{gis'-4^^ b gis} \times 2/3{gis'^^ b gis} | %18
    \times 2/3{<e, gis'>8^^ b gis} \times 2/3{fis'-2^^ b gis} \times 2/3{e'-0^^ b gis} | %19
    \set TabStaff.minimumFret = #2
    \cejilla "CII"
    \times 2/3{<fis,-1 e'-4>8\EC^^ a_1 fis-3} \times 2/3{dis'-4^^ a fis} \times 2/3{dis'^^ a fis} | %20
    \times 2/3{<fis, dis'>8^^ a fis} \times 2/3{d'-2^^ a fis} \times 2/3{dis'-4^^ a fis\FC} | %21
    \set TabStaff.minimumFret = #7
    \cejilla "CVII"
    \times 2/3{<b,-1 cis''-4>8\EC^^ fis'-1 dis'-2} 
       \times 2/3{cis''^^ fis' dis'} \times 2/3{cis''^^ fis' dis'} | %22
    \times 2/3{<b, cis''>8^^ fis' dis'} \times 2/3{dis''-4^^ fis' dis'} 
       \times 2/3{cis''-4^^ fis' dis'\FC} | %23
    \set TabStaff.minimumFret = #0
    \times 2/3{<e,-0 cis''-4>8^^ gis'-3\2 e'-2\3} \times 2/3{b'-1^^ gis'\2 e'\3} \times 2/3{b'^^ gis'\2 e'\3} | %24
    \cejilla "½CIX"
    \times 2/3{<e, b'>8^^ gis'\2 e'\3} \times 2/3{cis''-4^^ gis'\2 e'\3} 
        \times 2/3{dis''-3^^\EC gis'-1\2 e'-1\3} | %25 
    \times 2/3{<e, e''-4>8^^ gis'\2 e'\3} \times 2/3{e''^^ gis'\2 e'\3} 
       \times 2/3{e''^^ gis'\2 e'\3} | %26
    \times 2/3{<e, e''>8^^ gis'\2 e'\3} \times 2/3{dis''-3^^ gis'\2 e'\3} 
       \times 2/3{d''-2^^ gis'\2 e'\3\FC} | %27
    \cejilla "½CV"
    \times 2/3{<a,-0 cis''-4>8\EC^^ e'-1\2 cis'-2\3} \times 2/3{cis''^^ e'\2 cis'\3} 
       \times 2/3{cis''^^ e'\2 cis'\3} | %28
    \times 2/3{<a, cis''>8^^ e'\2 cis'\3} \times 2/3{b'-3^^ e'\2 cis'\3} 
       \times 2/3{a'-1^^ e'\2 cis'\3\FC} | %29
    \times 2/3{<b,-2 gis'-4>8^^ b_0 gis-1} \times 2/3{gis'^^ b gis} \times 2/3{gis'^^ b gis} | %30
    \cejilla "CII"
    \times 2/3{<b,-1 gis'-4>8\EC^^ dis'_3 a-1} \times 2/3{a'-4^^ dis' a} \times 2/3{fis'-1^^ dis' a\FC} | %31
    \times 2/3{<e-3 e'-0>8^^ b_0 gis-1} \times 2/3{<b,-2 e'>^^ b gis} \times 2/3{<gis,-4 e'>^^ b gis} | %32
    <e, b,-2 e-3 gis-1 b e'>2.\arpeggio^\markup{\hspace #-3 \italic \bold "D.S. al fine"} | %33
    
  }
}

notasAltas = { 
  \mark\markup{ \musicglyph #"scripts.segno" }
  \FOl
  \repeat volta 2 {
    \key e \minor
     #(override-auto-beam-setting '(end * * 3 4) 1 4)
     #(override-auto-beam-setting '(end * * 3 4) 2 4)
    \times 2/3{<  b'-4-\R #4 >8^^ 
	 <b-0-\R #3 > <g-0-\R #2 >} \times 2/3{b'^^ b g} \times 2/3{b'^^ b g} | %2
    \times 2/3{< b'>8^^ b g} \times 2/3{a'-2 ^^ b g} \times 2/3{g'-2 ^^ b g} | %3
    \times 2/3{< g'>^^ b g} \times 2/3{fis'-1^^ b g} \times 2/3{e'-0^^ b g} | %4
    \times 2/3{< e'>^^ b g} \times 2/3{g'-1^^ b g} \times 2/3{b'-4^^ b g} | %5
    \times 2/3{< e''-4>^^ b g} \times 2/3{e''^^ b g} \times 2/3{e''^^ b g} | %6
    \times 2/3{< e''>^^ b g} \times 2/3{d''-2^^ b g} \times 2/3{c''-1^^ b g} | %7
    \cejilla "½CV"
    \times 2/3{< c''-4>\EC^^ e'_1\2 c'-1\3} \times 2/3{b'^^-3 e'\2 c'\3} \times 2/3{a'-1^^ e'\2 c'\3} | %8
    \times 2/3{< a'-1>^^ e'\2 c'\3} \times 2/3{b'-3^^ e'\2 c'\3} \times 2/3{c''-4^^ e'\2 c'\3\FC} | %9
    \set TabStaff.minimumFret = #7
    \cejilla "CVII"
    \times 2/3{< b'-1>\EC^^ fis'-1 dis'-2} \times 2/3{c''^^-3 fis' dis'} \times 2/3{b'^^-1 fis' dis'} | %10
    \times 2/3{< dis''-4>^^ fis' dis'} \times 2/3{c''-3^^ fis' dis'} \times 2/3{b'-1^^ fis' dis'\FC} | %11
    \set TabStaff.minimumFret = #0
    \times 2/3{< b'-4>8^^ b_0 g-0} \times 2/3{a'-2^^ b g} \times 2/3{g'-2^^ b g} | %12
    \times 2/3{< g'>^^ b g} \times 2/3{fis'-1^^ b g} \times 2/3{e'-0^^ b g} | %13
    \times 2/3{< fis'-4>^^ b a-3} \times 2/3{fis'^^ b a} \times 2/3{fis'^^ b a} | %14
    \times 2/3{< fis'>^^ b a} \times 2/3{g'-4^^ b a} \times 2/3{fis'-4^^ b a} | %15
    \times 2/3{< e'-0>^^ b g} \times 2/3{< e'>^^ b g} \times 2/3{< e'>^^ b g} | %16
    <e, b,-2 e-3 g b e'>2.\arpeggio^\markup{\hspace #4 \italic\bold "fine"} | %17
  }
  \repeat volta 2 {
    \key e \major
    \times 2/3{< gis'^4>8^^ b_0 gis-1} \times 2/3{gis'-4^^ b gis} \times 2/3{gis'^^ b gis} | %18
    \times 2/3{< gis'>8^^ b gis} \times 2/3{fis'-2^^ b gis} \times 2/3{e'-0^^ b gis} | %19
    \set TabStaff.minimumFret = #2
    \cejilla "CII"
    \times 2/3{< e'-4>8\EC^^ a_1 fis-3} \times 2/3{dis'-4^^ a fis} \times 2/3{dis'^^ a fis} | %20
    \times 2/3{< dis'>8^^ a fis} \times 2/3{d'-2^^ a fis} \times 2/3{dis'-4^^ a fis\FC} | %21
    \set TabStaff.minimumFret = #7
    \cejilla "CVII"
    \times 2/3{< cis''-4>8\EC^^ fis'-1 dis'-2} 
       \times 2/3{cis''^^ fis' dis'} \times 2/3{cis''^^ fis' dis'} | %22
    \times 2/3{< cis''>8^^ fis' dis'} \times 2/3{dis''-4^^ fis' dis'} 
       \times 2/3{cis''-4^^ fis' dis'\FC} | %23
    \set TabStaff.minimumFret = #0
    \times 2/3{< cis''-4>8^^ gis'-3\2 e'-2\3} \times 2/3{b'-1^^ gis'\2 e'\3} \times 2/3{b'^^ gis'\2 e'\3} | %24
    \cejilla "½CIX"
    \times 2/3{< b'>8^^ gis'\2 e'\3} \times 2/3{cis''-4^^ gis'\2 e'\3} 
        \times 2/3{dis''-3^^\EC gis'-1\2 e'-1\3} | %25 
    \times 2/3{< e''-4>8^^ gis'\2 e'\3} \times 2/3{e''^^ gis'\2 e'\3} 
       \times 2/3{e''^^ gis'\2 e'\3} | %26
    \times 2/3{< e''>8^^ gis'\2 e'\3} \times 2/3{dis''-3^^ gis'\2 e'\3} 
       \times 2/3{d''-2^^ gis'\2 e'\3\FC} | %27
    \cejilla "½CV"
    \times 2/3{< cis''-4>8\EC^^ e'-1\2 cis'-2\3} \times 2/3{cis''^^ e'\2 cis'\3} 
       \times 2/3{cis''^^ e'\2 cis'\3} | %28
    \times 2/3{< cis''>8^^ e'\2 cis'\3} \times 2/3{b'-3^^ e'\2 cis'\3} 
       \times 2/3{a'-1^^ e'\2 cis'\3\FC} | %29
    \times 2/3{< gis'-4>8^^ b_0 gis-1} \times 2/3{gis'^^ b gis} \times 2/3{gis'^^ b gis} | %30
    \cejilla "CII"
    \times 2/3{< gis'-4>8\EC^^ dis'_3 a-1} \times 2/3{a'-4^^ dis' a} \times 2/3{fis'-1^^ dis' a\FC} | %31
    \times 2/3{< e'-0>8^^ b_0 gis-1} \times 2/3{< e'>^^ b gis} \times 2/3{< e'>^^ b gis} | %32
    <e, b,-2 e-3 gis-1 b e'>2.\arpeggio^\markup{\hspace #-3 \italic \bold "D.S. al fine"} | %33
    
  }
}

notasBajas = { 
  \mark\markup{ \musicglyph #"scripts.segno" }
  \FOl
  \repeat volta 2 {
    \key e \minor
    e,2.-0 e, e, e, e, e, a,-0 a, b,-1 b,-1 e,-0 e, b,-2 dis-1 e4-3 b,-2 
    g,-4 e,2.-0 
  }
  \repeat volta 2 {
    \key e \major
    e,2. e, fis,-1 fis, b,-1 b, e,-0 e, e, e, a,-0 a, b,-2 b,-1 e4-3 b,-2
    gis,-4 e,2.-0
  }
}

\new StaffGroup <<
   \time 3/4
   \new Staff {
     \set instrumentName = #"Guit."
     \clef "treble_8"
     <<
       \FOl
       \notasAltas
       \\
       \notasBajas
     >>
   }
   \new TabStaff {
     \notas
   }
>>
