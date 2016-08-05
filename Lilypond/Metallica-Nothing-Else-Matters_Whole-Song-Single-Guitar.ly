#(define (tie::tab-clear-tied-fret-numbers grob)
   (let* ((tied-fret-nr (ly:spanner-bound grob RIGHT)))
      (ly:grob-set-property! tied-fret-nr 'transparent #t)))

\version "2.10.5"
\paper {
   indent = #0
   printallheaders = ##t
   print-all-headers = ##t
   ragged-right = ##f
   ragged-bottom = ##t
}
\layout {
   \context { \Score
      \override MetronomeMark #'padding = #'5
   }
   \context { \Staff
      \override TimeSignature #'style = #'numbered
      \override StringNumber #'transparent = ##t
   }
   \context { \TabStaff
      \override TimeSignature #'style = #'numbered
      \override Stem #'transparent = ##t
      \override Beam #'transparent = ##t
      \override Tie  #'after-line-breaking = #tie::tab-clear-tied-fret-numbers
   }
   \context { \TabVoice
      \override Tie #'stencil = ##f
   }
   \context { \StaffGroup
      \consists "Instrument_name_engraver"
   }
}
deadNote = #(define-music-function (parser location note) (ly:music?)
   (set! (ly:music-property note 'tweaks)
      (acons 'stencil ly:note-head::print
         (acons 'glyph-name "2cross"
            (acons 'style 'special
               (ly:music-property note 'tweaks)))))
   note)

palmMute = #(define-music-function (parser location note) (ly:music?)
   (set! (ly:music-property note 'tweaks)
      (acons 'style 'do (ly:music-property note 'tweaks)))
   note)

TrackAVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)
#{
   \tempo 4=74
   \clef #(if $inTab "tab" "treble_8")
   \key g \major
   \time 6/8
   \oneVoice
   <e,~\6>8 <g\3>8-\tag #'texts ^\markup {"Tempo = 74"} <b\2 e,\6 >8 <e'\1 e,~\6 >8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   <b'\1 e,~\6 >8 <b\2>8 <g\3>8 <b'\1 b\2 >16 <e'\1>16 <b\2>8 <g\3 e,\6 >8 
   <b\2 e,\6 >8 <g\3>8 <b'\1 b\2 >16. r32 <c''\1 b\2 >8 <b'\1>16. <c''\1>32 <a'\1>8 
   \time 3/8
   <b'\1 b~\2 >8 \times 2/3 {<a'\1>16 <g'\1>16 <fis'\1 b\2 >16 } <e'\2>8 
   \time 6/8
   <e'\2 a,~\5 >8 <c'\3>8 <e'\2>8 <fis'\1>16 <e'\1>16 <e'\2>8 <c'\3 a,\5 >8 
   <a,~\5>8 <c'\3>8 <e'\2>8 <e'\1 a,\5 >8 <e'\1 e'\2 c'\3 a,\5 >16-\tag #'chords ^\markup \fret-diagram #"1-o;2-5;3-5;4-x;5-o;6-x;" r16 <e'\1 e'\2 c'\3 b,\5 >16 r16 
   <e'\1 e'\2 c'\3 c\5 >8 <c~\5>16 <c'\3>16 <e'\2>16 <c'\3>16 <g'\1>16 <e'\1>16 <e'\2>16 <c'\3 c\5 >16 <e'\1 e'\2 c'\3 c\5 >16 r16 
   <e'\1 fis'\2 d'\3 d\5 >8 <d~\5>16 <d'\3>16 <fis'\2>16 <d'\3>16 \times 2/3 {<e'\1>16 <a'\1>16 <e'\1>16 } <fis'\2>16 <b\2>16 <b\2>16 <e'\2 d\5 >16 
   <e,~\6>8 <b'\2\harmonic g'\3\harmonic >8 <b'\2\harmonic>8 <e''\1\harmonic>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8.-\tag #'chords ^\markup \fret-diagram #"1-7;2-8;3-9;4-9;5-7;6-o;" <e\5>16 <b\4>16 <e'\3>16 <b'\1 g'\2 e,\6 >4.\prall 
   <d~\5>8-\tag #'chords ^\markup \fret-diagram #"1-x;2-7;3-7;4-7;5-5;6-x;" <a\4>8 <fis'\2 d'\3 d\5 >8 <c~\5>8-\tag #'chords ^\markup \fret-diagram #"1-x;2-5;3-5;4-5;5-3;6-x;" <g\4>8 <e'\2 c'\3 c\5 >8 
   <e,~\6>8.-\tag #'chords ^\markup \fret-diagram #"1-7;2-8;3-9;4-9;5-7;6-o;" <e\5>16 <b\4>16 <e'\3>16 <b'\1 g'\2 e,\6 >4.\prall 
   <d~\5>8-\tag #'chords ^\markup \fret-diagram #"1-x;2-7;3-7;4-7;5-5;6-x;" <a\4>8 <fis'\2 d'\3 d\5 >8 <c~\5>8-\tag #'chords ^\markup \fret-diagram #"1-x;2-5;3-5;4-5;5-3;6-x;" <g\4>8 <e'\2 c'\3 c\5 >8 
   <e,~\6>8.-\tag #'chords ^\markup \fret-diagram #"1-7;2-8;3-9;4-9;5-7;6-o;" <e\5>16 <b\4>16 <e'\3>16 <b'\1 g'\2 e,\6 >4.\prall 
   <d~\5>8-\tag #'chords ^\markup \fret-diagram #"1-5;2-7;3-7;4-x;5-5;6-x;" \times 2/3 {<a'\1>16. <fis'\2>16. <d'\3 d\5 >8. } <c~\5>8-\tag #'chords ^\markup \fret-diagram #"1-3;2-5;3-5;4-x;5-3;6-x;" \times 2/3 {<g'\1>16. <e'\2>16. <c'\3 c\5 >8. } 
   <g,~\6>8-\tag #'chords ^\markup \fret-diagram #"1-3;2-3;3-4;4-x;5-3;6-x;" \times 2/3 {<g'\1>16. <d'\2>16. <b\3 g,\6 >8. } <b,~\5>8-\tag #'chords ^\markup \fret-diagram #"1-2;2-4;3-2;4-x;5-2;6-x;" \times 2/3 {<fis'\1>16. <dis'\2>16. <a\3 b,\5 >8. } 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8-\tag #'chords ^\markup \fret-diagram #"1-3;2-3;3-o;4-o;5-2;6-3;" <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <g'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8 <b,\5>16 <fis'\1>16 <b\2>8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <g'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8 <b,\5>16 <fis'\1>16 <b\2>8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2 e,\6 >8 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <g'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8 <b,\5>16 <fis'\1>16 <b\2>8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-o;2-1;3-o;4-2;5-3;6-x;" <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-o;2-2;3-2;4-2;5-o;6-x;" 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-2;2-3;3-2;4-o;5-x;6-x;" <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-o;2-1;3-o;4-2;5-3;6-x;" <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-o;2-2;3-2;4-2;5-o;6-x;" 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-2;2-3;3-2;4-o;5-x;6-x;" <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio-\tag #'chords ^\markup \fret-diagram #"1-3;2-3;3-2;4-o;5-x;6-x;" <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   \time 3/8
   <fis'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio 
   \time 6/8
   <e'~\1 b~\2 g~\3 e~\4 b,~\5 e,~\6 >2.-\tag #'chords ^\markup \fret-diagram #"1-o;2-o;3-o;4-2;5-2;6-o;" 
   <e'\1 b\2 g\3 e\4 b,\5 e,\6 >2. 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <g'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8 <b,\5>16 <fis'\1>16 <b\2>8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   \time 3/8
   <fis'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio 
   \time 6/8
   <e'\1 b\2 g\3 e\4 b,\5 e,\6 >2. 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e''~\1 b'\2 >8 <e''\1 b'\2 >4 <fis''~\1 b'\2 >8 <fis''\1 b'\2 >4 
   <g''~\1 b'\2 >8 <g''\1 b'\2 >4 <a''~\1 b'\2 >8 <a''\1 b'\2 >4 
   <c''\1>8 <e'\2>8 <c'\3>8 <c''\1>8 <e'\2>8 <c'~\3>8 
   <c'\3>8 <c'\3>8 <e'\2>8 <c''\1>8 <e'\2>8 <c'\3>8 
   <e'\1>8 <c'\2>8 <g\3>8 r8 <e'\1 g\3 >8 <c'\2>8 
   <e'\1>8 <d'\2>8 <a\3>8 r8 <e'\1 a\3 >8 <d'\2>8 
   <e'\1>16 <b'\1>16 <b\2>8 <g~\3>8 <b'\1 g\3 >16 <e'\1>16 <b\2>8 <g~\3>8 
   <g\3 e,~\6 >8 <g\3>8 <b\2>8 <e'\1 e,\6 >4. 
   <e''~\1 b'\2 >8 <e''\1 b'\2 >4 <fis''~\1 b'\2 >8 <fis''\1 b'\2 >4 
   <g''~\1 b'\2 >8 <g''\1 b'\2 >4 <a''~\1 b'\2 >8 <a''\1 b'\2 >4 
   <c''\1>8 <e'\2>8 <c'~\3>8 <c''\1 c'\3 >8 <e'\2>8 <c'~\3>8 
   <c'\3>8 <c'\3>8 <e'\2>8 <c''\1>8 <e'\2>8 <c'\3>8 
   <e'\1>8 <c'\2>8 <g\3>8 r8 <e'\1 g\3 >8 <c'\2>8 
   r8 <g'\3>8 <g'\3>16 <a'~\3>16\prall <a'\3>8 <g'\3>16 <a'\3>16 <\bendAfter #+6 a'\3>8 
   <g'\3>16 <b'~\2>16 <b'\2>4 <b'\2>16 <e'~\4>16 <e'\4>4 
   r8 <d''\2 a'\3 >16 r16 <d''\2 \bendAfter #+6 a'\3 >8\prall <d''\2 \bendAfter #+6 a'\3 >16\prall <g'\3>16 <e'\4>16\prall <d'\4>16 \grace <d'\4>64 <e'\4>16 <g'\3>16 
   <e'~\4 e,~\6 >8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e'\4 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <g'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8 <b,\5>16 <fis'\1>16 <b\2>8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2 e,\6 >8 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b~\2>16 <b\2 g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <g'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8 <b,\5>16 <fis'\1>16 <b\2>8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   <fis'\1 d'\2 a\3 d\4 >8.\arpeggio <fis'~\1 d'~\2 a~\3 d~\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <g'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio <e'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio 
   <e'\1 c'\2 g\3 e\4 c\5 >4.\arpeggio <e'\1 cis'\2 a\3 e\4 a,\5 >4.\arpeggio 
   \time 3/8
   <fis'\1 d'\2 a\3 d\4 >8\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >16\arpeggio <fis'\1 d'\2 a\3 d\4 >8\arpeggio 
   \time 6/8
   <e'~\1 b~\2 g~\3 e~\4 b,~\5 e,~\6 >2. 
   <e'\1 b\2 g\3 e\4 b,\5 e,\6 >2. 
   <\parenthesize d''~\2 \bendAfter #+6 a'\3 >4 <d''\2 \bendAfter #+6 a'\3 >8 <g'\3>4\prall <a'\3>64 r32. <g'\3>16 
   <fis'\3>16 <g'\3>16 <fis'\3>16 <e'\4>16 <fis'\3>16 <d'\4>16 <e'~\4>8\prall <e'\4>16 <g'\3>16 <a'\3>16 <g'\3>16 
   <\bendAfter #+6 a'\3>16 <b'\2>16 <e''\1>16 <\bendAfter #+6 a'\3>16 <b'\2>16 <e''\1>16 <d''\2>16 <b'\2>16 <ais'\3>16 <b'\2>16 <ais'\3>16 <a'\3>16 
   <\bendAfter #+6 g'~\3>16 <g'\3>32 <e'\4>32 <cis''\2 a'\3 >16 r16 <cis''\2 a'\3 >16 <gis'\3>16 <g'\3>4.\prall 
   <g''\1>8 <fis''\1>8 <b'\2>8 <g''\1>8 <fis''\1>16. <g''\1>32 \grace <g''\1>64 <a''\1>16. <a''\1>32 
   <g''\1>16 <fis''\1>64 <g''\1>32 <fis''\1>64 <e''\1>16 <b'\2>16 <g''\1>16 <fis''\1>16 <b'\2>8. <g'\3>16 <a'\3>16 <g'\3>16 
   <d''\2 \bendAfter #+6 a'\3 >16. <g'\3>32 <e'\4>16 <g'\3>16 <\bendAfter #+6 a'\3>16 <b'\2>16 <e''\1>8 <d''\2>16 <\bendAfter #+6 d''~\2>8 <d''\2>64 <b'\2>32. 
   <\bendAfter #+6 d''~\2>2. 
   <d''~\2>4. <d''\2>4 <d''\2>8 
   <b'\2>16 <d''\2>16 <b'\2>2 <fis'\2>8 
   <e'\2>16 <fis'\2>16 <e'~\2>4. <e'\2>4 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <e'\1 c\5 >8 <d'\2>16 <g\3>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <d'\2>16 <a\3>16 <g\3>16 <d'\2 c\5 >8 <g\3>16 <d'\2>16 <g,\6>16 <fis,\6>16 
   <e,~\6>8 <g\3>8 <b\2>8 <g'\1>8 <g\3>16 <e'\1>16 <b\2>16 <g\3 e,\6 >16 
   <fis'\1 d\4 >8 <d\4>16 <g'\1>16 <d'\2>16 <g\3>16 <b'\1 c\5 >8 <d'\2>8 <g\3>8 
   <g,\6>8 <g\3>8 <g'\1 d'\2 >8 <fis'\1 b\2 a\3 b,\5 >8. <fis'\1 b\2 a\3 b,\5 >8. 
   <e,~\6>8-\tag #'texts ^\markup {"Outro ... slowly softens to almost nothing "} <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   <b'\1 e,~\6 >8 <b\2>8 <g\3>8 <b'\1 b\2 >16 <e'\1>16 <b\2>8 <g\3 e,\6 >8 
   <b\2 e,\6 >8 <g\3>8 <b'\1 b\2 >8 <c''\1 b\2 >8 <b'\1>16. <c''\1>32 <a'\1>8 
   \time 3/8
   <b'\1 b\2 >8 \times 2/3 {<a'\1>16 <g'\1>16 <fis'\1>16 } <e'\2>8 
   \time 6/8
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   <b'\1 e,~\6 >8 <b\2>8 <g\3>8 <b'\1 b\2 >16 <e'\1>16 <b\2>8 <g\3 e,\6 >8 
   <b\2 e,\6 >8 <g\3>8 <b'\1 b\2 >8 <c''\1 b\2 >8 <b'\1>16. <c''\1>32 <a'\1>8 
   \time 3/8
   <b'\1 b\2 >8 \times 2/3 {<a'\1>16 <g'\1>16 <fis'\1>16 } <e'\2>8 
   \time 6/8
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   <b'\1 e,~\6 >8 <b\2>8 <g\3>8 <b'\1 b\2 >16 <e'\1>16 <b\2>8 <g\3 e,\6 >8 
   <b\2 e,\6 >8 <g\3>8 <b'\1 b\2 >8 <c''\1 b\2 >8 <b'\1>16. <c''\1>32 <a'\1>8 
   \time 3/8
   <b'\1 b\2 >8 \times 2/3 {<a'\1>16 <g'\1>16 <fis'\1>16 } <e'\2>8 
   \time 6/8
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   <b'\1 e,~\6 >8 <b\2>8 <g\3>8 <b'\1 b\2 >16 <e'\1>16 <b\2>8 <g\3 e,\6 >8 
   <b\2 e,\6 >8 <g\3>8 <b'\1 b\2 >8 <c''\1 b\2 >8 <b'\1>16. <c''\1>32 <a'\1>8 
   \time 3/8
   <b'\1 b\2 >8 \times 2/3 {<a'\1>16 <g'\1>16 <fis'\1>16 } <e'\2>8 
   \time 6/8
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   <b'\1 e,~\6 >8 <b\2>8 <g\3>8 <b'\1 b\2 >16 <e'\1>16 <b\2>8 <g\3 e,\6 >8 
   <b\2 e,\6 >8 <g\3>8 <b'\1 b\2 >8 <c''\1 b\2 >8 <b'\1>16. <c''\1>32 <a'\1>8 
   \time 3/8
   <b'\1 b\2 >8 \times 2/3 {<a'\1>16 <g'\1>16 <fis'\1>16 } <e'\2>8 
   \time 6/8
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <g\3 e,\6 >8 
   <e,~\6>8 <g\3>8 <b\2>8 <e'\1>8 <b\2>8 <b'\1 e,\6 >16 r16 
   r2. 
   r2. 
   \bar "|."
   \pageBreak
#})
TrackAVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)
#{
#})
TrackALyrics = \lyricmode {
   \set ignoreMelismata = ##t
   
   \unset ignoreMelismata
}
TrackAStaff = \new Staff <<
   \context Voice = "TrackAVoiceAMusic" {
      \TrackAVoiceAMusic ##f
   }
   \context Voice = "TrackAVoiceBMusic" {
      \TrackAVoiceBMusic ##f
   }
>>
TrackATabStaff = \new TabStaff \with { stringTunings = #'( 4 -1 -5 -10 -15 -20 ) } <<
   \context TabVoice = "TrackAVoiceAMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceAMusic ##t
   }
   \context TabVoice = "TrackAVoiceBMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceBMusic ##t
   }
>>
TrackAStaffGroup = \new StaffGroup <<
   \TrackAStaff
   \TrackATabStaff
>>
\score {
   \TrackAStaffGroup
   \header {
      title = "Nothing Else Matters" 
      composer = "Metallica" 
      instrument = "Guitar 1" 
   }
}
