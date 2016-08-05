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
   \tempo 4=90
   \clef ("treble_8")
   \key a \minor
   \set Staff.instrumentName = #"Guit."
   \time 3/8
   \voiceOne
   r16 <gis\3 b\2 >16 r16 <b\2 gis\3 >16 r16 <b\2 gis\3 >16 
   r16 <gis\3 b\2 >16 r16 <b\2 gis\3 >16 r16 <b\2 gis\3 >16 
   r16 <c'\2 a\3 >16 r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 
   r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 
   r16 <b\2 gis\3 >16 r16 <gis\3 b\2 >16 r16 <gis\3 b\2 >16 
   r16 <gis\3 b\2 >16 r16 <gis\3 b\2 >16 r16 <gis\3 b\2 >16 
   r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 
   r16 <c'\2 a\3 >16 r16 <c'\2 a\3 >16 r16 <c'\2 a\3 >16 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <c'\2>16 <e'\1>16 r16 <e'\2>16 <e'\1>16 r16 <d'\2>16 <e'\1>16 } 
   \times 2/3 {r16 <c'\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <a\3>16 <e'\1>16 } 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <e'\2>16 <e'\1>16 r16 <d'\2>16 <e'\1>16 r16 <c'\2>16 <e'\1>16 } 
   \times 2/3 {r16 <c'\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <a\3>16 <e'\1>16 } 
   r16 <e'\1>16 <b\2>16 <gis\3>16 r16 r16 
   r16 <e'\1>16 <b\2>16 <gis\3>16 r16 r16 
   r16 <f'\1>16 <c'\2>16 <a\3>16 r16 r16 
   r16 <f'\1>16 <c'\2>16 <a\3>16 r16 r16 
   r16 <g'\1>16 <d'\2>16 <b\3>16 r16 r16 
   r16 <f'\1>16 <c'\2>16 <a\3>16 r16 r16 
   r8 <gis\3>8 <b\2>8 
   r16 <gis\3>16 <e\4>16 <b,\5>16 r16 r16 
   r16 <gis\3>16 <e\4>16 <b,\5>16 r16 r16 
   r16 <a\3>16 <f\4>16 <c\5>16 r16 r16 
   r16 <a\3>16 <f\4>16 <c\5>16 r16 r16 
   r16 <b\2>16 <g\3>16 <d\4>16 r16 r16 
   r16 <a\3>16 <f\4>16 <c\5>16 r16 r16 
   r4. 
   <gis\3 b\2 e'\1 >4 r8 
   \oneVoice
   <d\4>16 <e\4>16 <f\4>16 <g\4>16 <f\4>16 <e\4>16 
   <d\4>16 <e\4>16 <f\4>16 <g\4>16 <f\4>16 <e\4>16 
   <d\4>16 <e\4>16 <f\4>16 <g\4>16 <a\3>16 <g\3>16 
   <f\4>16 <e\4>16 <g\4>16 <f\4>16 <e\4>16 <d\4>16 
   <c\5>8 <f\4>16 <e\4>16 <d\4>16 <c\5>16 
   <b,\5>16 <c\5>16 <a,\5>16 <b,\5>16 <g,\6>16 <f,\6>16 
   \voiceOne
   \skip 8 r8 <gis\3 b\2 e'\1 >8 
   <c'\3 e'\2 a'\1 >8 r8 r8 
   \oneVoice
   <c'\2>8 <c'\2>8 <c'\2>8 
   <c'\2>8 <d'\2>8 <e'\2>8 
   <e'\2>8 \times 2/3 {<d'\2>16 <e'\2>16 <d'\2>16 } <b\2>16 <a\3>16 
   <c'\2>4. 
   \voiceOne
   r16 <e'\1>16 r16 <c'\2>16 r16 <c'\2>16 
   r16 <c'\2>16 r16 r16 r16 r16 
   r4. 
   r4. 
   r4. 
   \oneVoice
   <a\3>4. 
   \voiceOne
   r16 <a\3>16 r16 <a\3>16 r16 <a\3>16 
   r16 <a\3>16 \skip 8 \skip 8 
   \oneVoice
   <d'\2>8 <d'\2>8 <d'\2>8 
   <d'\2>8 <e'\2>8 <f'\2>8 
   <e'\2>8 \times 2/3 {<d'\2>16 <e'\2>16 <d'\2>16 } <c'\2>16 <b\2>16 
   <c'\2>4. 
   \voiceOne
   r16 <c'\2>16 r16 <c'\2>16 r16 <c'\2>16 
   r16 <c'\2>16 \skip 8 \skip 8 
   \oneVoice
   <d'\2>8 <d'\2>8 <d'\2>8 
   <d'\2>8 <f'\2>8 <e'\2>8 
   <d'\2>8 \times 2/3 {<c'\2>16 <d'\2>16 <c'\2>16 } <b\2>16 <a\3>16 
   <g\3>4. 
   \voiceOne
   r16 <g\3>16 r16 <g\3>16 r16 <g\3>16 
   r16 <g\3>16 \skip 8 \skip 8 
   r4. 
   r4. 
   r4. 
   r4. 
   r16 <c'\2>16 r16 <c'\2>16 r16 <c'\2>16 
   r16 <c'\2>16 \skip 8 \skip 8 
   r4. 
   r4. 
   r4. 
   r4. 
   r4. 
   r4. 
   r4. 
   r4. 
   r16 <gis\3 b\2 >16 r16 <b\2 gis\3 >16 r16 <b\2 gis\3 >16 
   r16 <gis\3 b\2 >16 r16 <b\2 gis\3 >16 r16 <b\2 gis\3 >16 
   r16 <c'\2 a\3 >16 r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 
   r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 
   r16 <b\2 gis\3 >16 r16 <gis\3 b\2 >16 r16 <gis\3 b\2 >16 
   r16 <gis\3 b\2 >16 r16 <gis\3 b\2 >16 r16 <gis\3 b\2 >16 
   r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 r16 <a\3 c'\2 >16 
   r16 <c'\2 a\3 >16 r16 <c'\2 a\3 >16 r16 <c'\2 a\3 >16 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <c'\2>16 <e'\1>16 r16 <e'\2>16 <e'\1>16 r16 <d'\2>16 <e'\1>16 } 
   \times 2/3 {r16 <c'\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <a\3>16 <e'\1>16 } 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 } 
   \times 2/3 {r16 <e'\2>16 <e'\1>16 r16 <d'\2>16 <e'\1>16 r16 <c'\2>16 <e'\1>16 } 
   \times 2/3 {r16 <c'\2>16 <e'\1>16 r16 <b\2>16 <e'\1>16 r16 <a\3>16 <e'\1>16 } 
   r16 <e'\1>16 <b\2>16 <gis\3>16 r16 r16 
   r16 <e'\1>16 <b\2>16 <gis\3>16 r16 r16 
   r16 <f'\1>16 <c'\2>16 <a\3>16 r16 r16 
   r16 <f'\1>16 <c'\2>16 <a\3>16 r16 r16 
   r16 <g'\1>16 <d'\2>16 <b\3>16 r16 r16 
   r16 <f'\1>16 <c'\2>16 <a\3>16 r16 r16 
   r8 <gis\3>8 <b\2>8 
   r16 <gis\3>16 <e\4>16 <b,\5>16 r16 r16 
   r16 <gis\3>16 <e\4>16 <b,\5>16 r16 r16 
   r16 <a\3>16 <f\4>16 <c\5>16 r16 r16 
   r16 <a\3>16 <f\4>16 <c\5>16 r16 r16 
   r16 <b\2>16 <g\3>16 <d\4>16 r16 r16 
   r16 <a\3>16 <f\4>16 <c\5>16 r16 r16 
   r4. 
   <gis\3 b\2 e'\1 >4 r8 
   \oneVoice
   <d\4>16 <e\4>16 <f\4>16 <g\4>16 <f\4>16 <e\4>16 
   <d\4>16 <e\4>16 <f\4>16 <g\4>16 <f\4>16 <e\4>16 
   <d\4>16 <e\4>16 <f\4>16 <g\4>16 <a\3>16 <g\3>16 
   <f\4>16 <e\4>16 <g\4>16 <f\4>16 <e\4>16 <d\4>16 
   <c\5>8 <f\4>16 <e\4>16 <d\4>16 <c\5>16 
   <b,\5>16 <c\5>16 <a,\5>16 <b,\5>16 <g,\6>16 <f,\6>16 
   \voiceOne
   \skip 8 r8 <gis\3 b\2 e'\1 >8 
   <c'\3 e'\2 a'\1 >8 r8 r8 
   \bar "|."
   \pageBreak
#})
TrackAVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)
#{
   \tempo 4=90
   \clef #(if $inTab "tab" "treble_8")
   \key c \major
   \time 3/8
   \voiceTwo
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <a,\5>8 <c\5>8 <b,\5>8 
   <a,\5>8 <g,\6>8 <f,\6>8 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <a,\5>8 <c\5>8 <b,\5>8 
   <a,\5>8 <g,\6>8 <f,\6>8 
   <e\4>8 <gis\3>8 <b\3>8 
   <e\4>8 <gis\3>8 <b\3>8 
   <a\3>8 <c'\3>8 <b\3>8 
   <a\3>8 <g\3>8 <f\4>8 
   <e\4>8 <gis\3>8 <b\3>8 
   <d'\3>8 <c'\3>8 <b\3>8 
   <c'\3>8 <b\3>8 <a\3>8 
   <a\3>8 <g\3>8 <f\4>8 
   <e\4>4 <e\4>8 
   <e\4>4 <e\4>8 
   <f\4>4 <f\4>8 
   <f\4>4 <f\4>8 
   <g\4>4 <g\4>8 
   <f\4>4 <f\4>8 
   <e\4>4. 
   <e,\6>4 <e,\6>8 
   <e,\6>4 <e,\6>8 
   <f,\6>4 <f,\6>8 
   <f,\6>4 <f,\6>8 
   <g,\6>4 <g,\6>8 
   <f,\6>4 <f,\6>8 
   <e,\6>4 <b,\5>8 
   <e\4>4. 
   \oneVoice
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \voiceTwo
   <e,\6>8 \skip 8 <e\4>8 
   <a,\5>8 \skip 8 \skip 8 
   \oneVoice
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \voiceTwo
   <c\5>8 <e\4>8 <g\3>8 
   <c\5>8 <e\4>8 <g\3>8 
   <c'\2>8 <c'\2>8 <c'\2>8 
   <c'\2>8 <c'\2>8. <b\2>16 
   <d'\2>8 \times 2/3 {<c'\2>16 } \times 2/3 {<d'\2>16 } \times 2/3 {<c'\2>16 <b\2>16 <a\3>16 } 
   \oneVoice
   \skip 8*3 
   \voiceTwo
   <f,\6>8 <a,\5>8 <c\5>8 
   <f,\6>8 <a,\5>8 <c\5>8 
   \oneVoice
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \voiceTwo
   <c\5>8 <e\4>8 <g\3>8 
   <c\5>8 <e\4>8 <g\3>8 
   \oneVoice
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \voiceTwo
   <g,\6>8 <b,\5>8 <d\4>8 
   <g,\6>8 <b,\5>8 <d\4>8 
   <d'\2>16 <e'\2>16 <f'\2>16 <g'\1>16 <f'\2>16 <d'\2>16 
   <f'\2>8 \times 2/3 {<e'\2>16 } \times 2/3 {<f'\2>16 } \times 2/3 {<e'\2>16 <d'\2>16 <b\2>16 } 
   <d'\2>16 <e'\2>16 <f'\2>16 <a'\1>16 <g'\1>16 <f'\1>16 
   <g'\1>8 \times 2/3 {<f'\1>16 } \times 2/3 {<g'\1>16 } \times 2/3 {<f'\1>16 <e'\1>16 <d'\2>16 } 
   <c\5>8 <e\4>8 <g\3>8 
   <c\5>8 <e\4>8 <g\3>8 
   <a\3>16 <b\2>16 <c'\2>16 <b\2>16 <d'\2>16 <c'\2>16 
   <e'\2>8 \times 2/3 {<d'\2>16 } \times 2/3 {<e'\2>16 } \times 2/3 {<d'\2>16 <c'\3>16 <b\3>16 } 
   <c'\3>16 <d'\2>16 <e'\2>16 <f'\2>16 <g'\1>16 <f'\2>16 
   <a'\1>8 \times 2/3 {<g'\1>16 } \times 2/3 {<a'\1>16 } \times 2/3 {<g'\1>16 <f'\2>16 <e'\2>16 } 
   <d'\2>32 <e'\2>32 <f'\2>32 <e'\2>32 <d'\2>32 <e'\2>32 <f'\2>32 <e'\2>32 <d'\2>32 <e'\2>32 <f'\2>32 <e'\2>32 
   <d'\2>32 <e'\2>32 <f'\2>32 <e'\2>32 <d'\2>32 <e'\2>32 <f'\2>32 <e'\2>32 <d'\2>32 <e'\2>32 <f'\2>32 <e'\2>32 
   <a'\1>8 \times 2/3 {<g'\1>16 } \times 2/3 {<a'\1>16 } \times 2/3 {<g'\1>16 <f'\2>16 <c'\2>16 } 
   <f'\2>8 \times 2/3 {<e'\2>16 } \times 2/3 {<f'\2>16 } \times 2/3 {<e'\2>16 <d'\2>16 <c'\2>16 } 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <a,\5>8 <c\5>8 <b,\5>8 
   <a,\5>8 <g,\6>8 <f,\6>8 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <e,\6>8 <gis,\6>8 <b,\5>8 
   <a,\5>8 <c\5>8 <b,\5>8 
   <a,\5>8 <g,\6>8 <f,\6>8 
   <e\4>8 <gis\3>8 <b\3>8 
   <e\4>8 <gis\3>8 <b\3>8 
   <a\3>8 <c'\3>8 <b\3>8 
   <a\3>8 <g\3>8 <f\4>8 
   <e\4>8 <gis\3>8 <b\3>8 
   <d'\3>8 <c'\3>8 <b\3>8 
   <c'\3>8 <b\3>8 <a\3>8 
   <a\3>8 <g\3>8 <f\4>8 
   <e\4>4 <e\4>8 
   <e\4>4 <e\4>8 
   <f\4>4 <f\4>8 
   <f\4>4 <f\4>8 
   <g\4>4 <g\4>8 
   <f\4>4 <f\4>8 
   <e\4>4. 
   <e,\6>4 <e,\6>8 
   <e,\6>4 <e,\6>8 
   <f,\6>4 <f,\6>8 
   <f,\6>4 <f,\6>8 
   <g,\6>4 <g,\6>8 
   <f,\6>4 <f,\6>8 
   <e,\6>4 <b,\5>8 
   <e\4>4. 
   \oneVoice
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \skip 8*3 
   \voiceTwo
   <e,\6>8 \skip 8 <e\4>8 
   <a,\5>8 \skip 8 \skip 8 
   \bar "|."
   \pageBreak
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
>>
\score {
   \TrackAStaffGroup
   \header {
      title = "Malagueñas" 
      composer = "Eythor Thorlakson" 
      instrument = "Guitarra" 
   }
}
