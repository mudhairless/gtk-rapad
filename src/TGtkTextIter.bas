#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTextIter( byval i as GtkTextIter ptr = 0 )
        id_ = i
        if id_ <> 0 then
            g_object_ref(id_)
        end if
    end constructor

    destructor TGtkTextIter()
        if id_ <> 0 then
            g_object_unref(id_)
        end if
    end destructor

    sub TGtkTextIter.copyFrom( byval i as GtkTextIter ptr )
        id_ = i
        g_object_ref(id_)
    end sub

    operator TGtkTextIter.cast() as GtkTextIter ptr
        return id_
    end operator

    property TGtkTextIter.offset() as integer
        return gtk_text_iter_get_offset(id_)
    end property

    property TGtkTextIter.offset( byval o as integer )
        gtk_text_iter_set_offset(id_,o)
    end property

    property TGtkTextIter.line() as integer
        return gtk_text_iter_get_line(id_)
    end property

    property TGtkTextIter.line( byval o as integer )
        gtk_text_iter_set_line(id_,o)
    end property

    property TGtkTextIter.lineOffset() as integer
        return gtk_text_iter_get_line_offset(id_)
    end property

    property TGtkTextIter.lineOffset( byval lo as integer )
        gtk_text_iter_set_line_offset(id_,lo)
    end property

    property TGtkTextIter.lineIndex() as integer
        return gtk_text_iter_get_line_index(id_)
    end property

    property TGtkTextIter.lineIndex( byval li as integer )
        gtk_text_iter_set_line_index(id_,li)
    end property

    property TGtkTextIter.visibleLineIndex() as integer
        return gtk_text_iter_get_visible_line_index(id_)
    end property

    property TGtkTextIter.visibleLineIndex( byval vli as integer )
        gtk_text_iter_set_visible_line_index(id_,vli)
    end property

    property TGtkTextIter.visibleLineOffset() as integer
        return gtk_text_iter_get_visible_line_offset(id_)
    end property

    property TGtkTextIter.visibleLineOffset( byval vlo as integer )
        gtk_text_iter_set_visible_line_offset(id_,vlo)
    end property

    property TGtkTextIter.char() as uinteger
        return gtk_text_iter_get_char(id_)
    end property

    function TGtkTextIter.sliceTo( byval i as TGtkTextIter ) as string
        return *gtk_text_iter_get_slice(id_,cast(GtkTextIter ptr,i))
    end function

    function TGtkTextIter.textTo( byval i as TGtkTextIter ) as string
        return *gtk_text_iter_get_text(id_,cast(GtkTextIter ptr,i))
    end function

    function TGtkTextIter.visibleSliceTo( byval i as TGtkTextIter ) as string
        return *gtk_text_iter_get_visible_slice(id_,cast(GtkTextIter ptr,i))
    end function

    function TGtkTextIter.visibleTextTo( byval i as TGtkTextIter ) as string
        return *gtk_text_iter_get_visible_text(id_,cast(GtkTextIter ptr,i))
    end function

    property TGtkTextIter.pixbuf() as GdkPixbuf ptr
        return gtk_text_iter_get_pixbuf(id_)
    end property

    property TGtkTextIter.marks() as GSList ptr
        return gtk_text_iter_get_marks(id_)
    end property

    property TGtkTextIter.toggledTags() as GSList ptr
        return gtk_text_iter_get_toggled_tags(id_,true)
    end property

    property TGtkTextIter.childAnchor() as GtkTextChildAnchor ptr
        return gtk_text_iter_get_child_anchor(id_)
    end property

    function TGtkTextIter.beginsTag( byval t as GtkTextTag ptr ) as gboolean
        return gtk_text_iter_begins_tag(id_,t)
    end function

    function TGtkTextIter.endsTag( byval t as GtkTextTag ptr ) as gboolean
        return gtk_text_iter_ends_tag(id_,t)
    end function

    function TGtkTextIter.togglesTag( byval t as GtkTextTag ptr ) as gboolean
        return gtk_text_iter_toggles_tag(id_,t)
    end function

    function TGtkTextIter.hasTag( byval t as GtkTextTag ptr ) as gboolean
        return gtk_text_iter_has_tag(id_,t)
    end function

    property TGtkTextIter.tags() as GSList ptr
        return gtk_text_iter_get_tags(id_)
    end property

    function TGtkTextIter.editable( byval default as gboolean ) as gboolean
        return gtk_text_iter_editable(id_,default)
    end function

    function TGtkTextIter.canInsert( byval default as gboolean ) as gboolean
        return gtk_text_iter_can_insert(id_,default)
    end function

    property TGtkTextIter.startsWord() as gboolean
        return gtk_text_iter_starts_word(id_)
    end property

    property TGtkTextIter.endsWord() as gboolean
        return gtk_text_iter_ends_word(id_)
    end property

    property TGtkTextIter.insideWord() as gboolean
        return gtk_text_iter_inside_word(id_)
    end property

    property TGtkTextIter.startsLine() as gboolean
        return gtk_text_iter_starts_line(id_)
    end property

    property TGtkTextIter.endsLine() as gboolean
        return gtk_text_iter_ends_line(id_)
    end property

    property TGtkTextIter.startsSentence() as gboolean
        return gtk_text_iter_starts_sentence(id_)
    end property

    property TGtkTextIter.endsSentence() as gboolean
        return gtk_text_iter_ends_sentence(id_)
    end property

    property TGtkTextIter.insideSentence() as gboolean
        return gtk_text_iter_inside_sentence(id_)
    end property

    property TGtkTextIter.charsInLine() as integer
        return gtk_text_iter_get_chars_in_line(id_)
    end property

    property TGtkTextIter.bytesInLine() as integer
        return gtk_text_iter_get_bytes_in_line(id_)
    end property

    function TGtkTextIter.getAttributes( byval v as GtkTextAttributes ptr ) as gboolean
        return gtk_text_iter_get_attributes(id_,v)
    end function

    property TGtkTextIter.language() as PangoLanguage ptr
        return gtk_text_iter_get_language(id_)
    end property

    property TGtkTextIter.isEnd() as gboolean
        return gtk_text_iter_is_end(id_)
    end property

    property TGtkTextIter.isStart() as gboolean
        return gtk_text_iter_is_start(id_)
    end property

    property TGtkTextIter.forwardChar() as gboolean
        return gtk_text_iter_forward_char(id_)
    end property

    property TGtkTextIter.backwardChar() as gboolean
        return gtk_text_iter_backward_char(id_)
    end property

    function TGtkTextIter.forwardChars( byval c as integer ) as gboolean
        return gtk_text_iter_forward_chars(id_,c)
    end function

    function TGtkTextIter.backwardChars( byval c as integer ) as gboolean
        return gtk_text_iter_backward_chars(id_,c)
    end function

    property TGtkTextIter.forwardLine() as gboolean
        return gtk_text_iter_forward_line(id_)
    end property

    property TGtkTextIter.backwardLine() as gboolean
        return gtk_text_iter_backward_line(id_)
    end property

    function TGtkTextIter.forwardLines( byval c as integer ) as gboolean
        return gtk_text_iter_forward_lines(id_,c)
    end function

    function TGtkTextIter.backwardLines( byval c as integer ) as gboolean
        return gtk_text_iter_backward_lines(id_,c)
    end function

    function TGtkTextIter.forwardWordEnds( byval c as integer ) as gboolean
        return gtk_text_iter_forward_word_ends(id_,c)
    end function

    function TGtkTextIter.backwardWordStarts( byval c as integer ) as gboolean
        return gtk_text_iter_backward_word_starts(id_,c)
    end function

    property TGtkTextIter.forwardWordEnd() as gboolean
        return gtk_text_iter_forward_word_end(id_)
    end property

    property TGtkTextIter.backwardWordStart() as gboolean
        return gtk_text_iter_backward_word_start(id_)
    end property

    property TGtkTextIter.forwardCursorPosition() as gboolean
        return gtk_text_iter_forward_cursor_position(id_)
    end property

    property TGtkTextIter.backwardCursorPosition() as gboolean
        return gtk_text_iter_backward_cursor_position(id_)
    end property

    function TGtkTextIter.forwardCursorPositions( byval c as integer ) as gboolean
        return gtk_text_iter_forward_cursor_positions(id_,c)
    end function

    function TGtkTextIter.backwardCursorPositions( byval c as integer ) as gboolean
        return gtk_text_iter_backward_cursor_positions(id_,c)
    end function

    property TGtkTextIter.backwardSentenceStart() as gboolean
        return gtk_text_iter_backward_sentence_start(id_)
    end property

    function TGtkTextIter.backwardSentenceStarts( byval c as integer ) as gboolean
        return gtk_text_iter_backward_sentence_starts(id_,c)
    end function

    property TGtkTextIter.forwardSentenceEnd() as gboolean
        return gtk_text_iter_forward_sentence_end(id_)
    end property

    function TGtkTextIter.forwardSentenceEnds( byval c as integer ) as gboolean
        return gtk_text_iter_forward_sentence_ends(id_,c)
    end function

    function TGtkTextIter.forwardVisibleWordEnds( byval c as integer ) as gboolean
        return gtk_text_iter_forward_visible_word_ends(id_,c)
    end function

    function TGtkTextIter.backwardVisibleWordStarts( byval c as integer ) as gboolean
        return gtk_text_iter_backward_visible_word_starts(id_,c)
    end function

    property TGtkTextIter.forwardVisibleWordEnd() as gboolean
        return gtk_text_iter_forward_visible_word_end(id_)
    end property

    property TGtkTextIter.backwardVisibleWordStart() as gboolean
        return gtk_text_iter_backward_visible_word_start(id_)
    end property

    property TGtkTextIter.forwardVisibleCursorPosition() as gboolean
        return gtk_text_iter_forward_visible_cursor_position(id_)
    end property

    property TGtkTextIter.backwardVisibleCursorPosition() as gboolean
        return gtk_text_iter_backward_visible_cursor_position(id_)
    end property

    function TGtkTextIter.forwardVisibleCursorPositions( byval c as integer ) as gboolean
        return gtk_text_iter_forward_visible_cursor_positions(id_,c)
    end function

    function TGtkTextIter.backwardVisibleCursorPositions( byval c as integer ) as gboolean
        return gtk_text_iter_backward_visible_cursor_positions(id_,c)
    end function

    property TGtkTextIter.forwardVisibleLine() as gboolean
        return gtk_text_iter_forward_visible_line(id_)
    end property

    property TGtkTextIter.backwardVisibleLine() as gboolean
        return gtk_text_iter_backward_visible_line(id_)
    end property

    function TGtkTextIter.forwardVisibleLines( byval c as integer ) as gboolean
        return gtk_text_iter_forward_visible_lines(id_,c)
    end function

    function TGtkTextIter.backwardVisibleLines( byval c as integer ) as gboolean
        return gtk_text_iter_backward_visible_lines(id_,c)
    end function

    sub TGtkTextIter.forwardToEnd()
        gtk_text_iter_forward_to_end(id_)
    end sub

    property TGtkTextIter.forwardToLineEnd() as gboolean
        return gtk_text_iter_forward_to_line_end(id_)
    end property

    function TGtkTextIter.forwardToTagToggle( byval t as GtkTextTag ptr ) as gboolean
        return gtk_text_iter_forward_to_tag_toggle(id_,t)
    end function

    function TGtkTextIter.backwardToTagToggle( byval t as GtkTextTag ptr ) as gboolean
        return gtk_text_iter_backward_to_tag_toggle(id_,t)
    end function

    function TGtkTextIter.forwardSearch( byref searchstr as string, byval flags as GtkTextSearchFlags, byval match_start as TGtkTextIter, byval match_end as TGtkTextIter, byval limit as TGtkTextIter ) as gboolean
        return gtk_text_iter_forward_search(id_,searchstr,flags,cast(GtkTextIter ptr,match_start),cast(GtkTextIter ptr,match_end),cast(GtkTextIter ptr,limit))
    end function

    function TGtkTextIter.backwardSearch( byref searchstr as string, byval flags as GtkTextSearchFlags, byval match_start as TGtkTextIter, byval match_end as TGtkTextIter, byval limit as TGtkTextIter ) as gboolean
        return gtk_text_iter_backward_search(id_,searchstr,flags,cast(GtkTextIter ptr,match_start),cast(GtkTextIter ptr,match_end),cast(GtkTextIter ptr,limit))
    end function

    function TGtkTextIter.inRange( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as gboolean
        return gtk_text_iter_in_range(id_,cast(GtkTextIter ptr,lhs),cast(GtkTextIter ptr,rhs))
    end function

    operator =( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
        return gtk_text_iter_equal(cast(GtkTextIter ptr,lhs),cast(GtkTextIter ptr,rhs))
    end operator

    operator <( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
        if gtk_text_iter_compare(cast(GtkTextIter ptr,lhs),cast(GtkTextIter ptr,rhs)) = -1 then
            return true
        else
            return false
        end if
    end operator

    operator >( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
        if gtk_text_iter_compare(cast(GtkTextIter ptr,lhs),cast(GtkTextIter ptr,rhs)) = 1 then
            return true
        else
            return false
        end if
    end operator

    operator <>( byref lhs as TGtkTextIter, byref rhs as TGtkTextIter ) as integer
        if gtk_text_iter_equal(cast(GtkTextIter ptr,lhs),cast(GtkTextIter ptr,rhs)) = false then
            return true
        end if
        return false
    end operator

end namespace
