namespace GtkRapad

type TGtkTextIter

    declare constructor( byval i as GtkTextIter ptr = 0 )
    declare destructor()
    declare sub copyFrom( byval i as GtkTextIter ptr )
    declare operator cast() as GtkTextIter ptr

    declare property offset() as integer
    declare property offset( byval o as integer )
    declare property line() as integer
    declare property line( byval o as integer )
    declare property lineOffset() as integer
    declare property lineOffset( byval lo as integer )
    declare property lineIndex() as integer
    declare property lineIndex( byval li as integer )
    declare property visibleLineIndex() as integer
    declare property visibleLineIndex( byval vli as integer )
    declare property visibleLineOffset() as integer
    declare property visibleLineOffset( byval vlo as integer )
    declare property char() as uinteger

    declare function sliceTo( byval i as TGtkTextIter ) as string
    declare function textTo( byval i as TGtkTextIter ) as string
    declare function visibleSliceTo( byval i as TGtkTextIter ) as string
    declare function visibleTextTo( byval i as TGtkTextIter ) as string

    declare property pixbuf() as GdkPixbuf ptr

    declare property marks() as GSList ptr
    declare property toggledTags() as GSList ptr
    declare property childAnchor() as GtkTextChildAnchor ptr

    declare function beginsTag( byval t as GtkTextTag ptr ) as gboolean
    declare function endsTag( byval t as GtkTextTag ptr ) as gboolean
    declare function togglesTag( byval t as GtkTextTag ptr ) as gboolean
    declare function hasTag( byval t as GtkTextTag ptr ) as gboolean
    declare property tags() as GSList ptr

    declare function editable( byval default as gboolean ) as gboolean
    declare function canInsert( byval default as gboolean ) as gboolean

    declare property startsWord() as gboolean
    declare property endsWord() as gboolean
    declare property insideWord() as gboolean
    declare property startsLine() as gboolean
    declare property endsLine() as gboolean
    declare property startsSentence() as gboolean
    declare property endsSentence() as gboolean
    declare property insideSentence() as gboolean
    declare property charsInLine() as integer
    declare property bytesInLine() as integer

    declare function getAttributes( byval v as GtkTextAttributes ptr ) as gboolean
    declare property language() as PangoLanguage ptr

    declare property isEnd() as gboolean
    declare property isStart() as gboolean

    declare property forwardChar() as gboolean
    declare property backwardChar() as gboolean
    declare function forwardChars( byval c as integer ) as gboolean
    declare function backwardChars( byval c as integer ) as gboolean

    declare property forwardLine() as gboolean
    declare property backwardLine() as gboolean
    declare function forwardLines( byval c as integer ) as gboolean
    declare function backwardLines( byval c as integer ) as gboolean

    declare function forwardWordEnds( byval c as integer ) as gboolean
    declare function backwardWordStarts( byval c as integer ) as gboolean
    declare property forwardWordEnd() as gboolean
    declare property backwardWordStart() as gboolean

    declare property forwardCursorPosition() as gboolean
    declare property backwardCursorPosition() as gboolean
    declare function forwardCursorPositions( byval c as integer ) as gboolean
    declare function backwardCursorPositions( byval c as integer ) as gboolean

    declare property backwardSentenceStart() as gboolean
    declare function backwardSentenceStarts( byval c as integer ) as gboolean
    declare property forwardSentenceEnd() as gboolean
    declare function forwardSentenceEnds( byval c as integer ) as gboolean

    declare function forwardVisibleWordEnds( byval c as integer ) as gboolean
    declare function backwardVisibleWordStarts( byval c as integer ) as gboolean
    declare property forwardVisibleWordEnd() as gboolean
    declare property backwardVisibleWordStart() as gboolean

    declare property forwardVisibleCursorPosition() as gboolean
    declare property backwardVisibleCursorPosition() as gboolean
    declare function forwardVisibleCursorPositions( byval c as integer ) as gboolean
    declare function backwardVisibleCursorPositions( byval c as integer ) as gboolean

    declare property forwardVisibleLine() as gboolean
    declare property backwardVisibleLine() as gboolean
    declare function forwardVisibleLines( byval c as integer ) as gboolean
    declare function backwardVisibleLines( byval c as integer ) as gboolean

    declare sub forwardToEnd()
    declare property forwardToLineEnd() as gboolean
    declare function forwardToTagToggle( byval t as GtkTextTag ptr ) as gboolean
    declare function backwardToTagToggle( byval t as GtkTextTag ptr ) as gboolean

    declare function forwardSearch( byref searchstr as string, byval flags as GtkTextSearchFlags, byval match_start as TGtkTextIter, byval match_end as TGtkTextIter, byval limit as TGtkTextIter ) as gboolean
    declare function backwardSearch( byref searchstr as string, byval flags as GtkTextSearchFlags, byval match_start as TGtkTextIter, byval match_end as TGtkTextIter, byval limit as TGtkTextIter ) as gboolean

    declare function inRange( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as gboolean

    private:
    as GtkTextIter ptr id_
end type

declare operator =( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
declare operator <( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
declare operator >( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
declare operator <>( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer

end namespace
