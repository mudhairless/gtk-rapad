'
'   TGtkTextView.bas
'
'   This function, unlike most, does return its id_ when referenced
'   but rather retuns the scrolled window which contains it.
'   If you must reference the actual buffer in an external function
'   you should use the View() accessor.


#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkTextView)
    
    constructor TGtkTextView
        textbuffer_ = gtk_text_buffer_new( cast(GtkTextTagTable ptr,texttagtable_) )
        id_ = gtk_text_view_new_with_buffer( textbuffer_ )
        gtk_container_add( GTK_CONTAINER( cast(GtkWidget ptr,scrollwindow_) ), GTK_WIDGET( id_ ) )
        init()
    end constructor

    constructor TGtkTextView( byval b as GtkTextBuffer ptr )
        textbuffer_ = b
        id_ = gtk_text_view_new_with_buffer( textbuffer_ )
        gtk_container_add( GTK_CONTAINER( cast(GtkWidget ptr,scrollwindow_) ), GTK_WIDGET( id_ ) )
        init()
    end constructor

    function TGtkTextView.createMark( byref mark_name as string, byval where_ as TGtkTextIter, byval left_gravity as gboolean ) as TGtkTextMark
        return TGtkTextMark(gtk_text_buffer_create_mark(textbuffer_,mark_name,cast(GtkTextIter ptr,where_),left_gravity))
    end function

    sub TGtkTextView.addMark( byval m as TGtkTextMark, byval where_ as TGtkTextIter )
        gtk_text_buffer_add_mark(textbuffer_,cast(GtkTextMark ptr,m),cast(GtkTextIter ptr,where_))
    end sub

    sub TGtkTextView.moveMark overload ( byval m as TGtkTextMark, byval where_ as TGtkTextIter )
        gtk_text_buffer_move_mark(textbuffer_,cast(GtkTextMark ptr,m),cast(GtkTextIter ptr,where_))
    end sub

    sub TGtkTextView.moveMark ( byref m_name as string, byval where_ as TGtkTextIter )
        gtk_text_buffer_move_mark_by_name(textbuffer_,m_name,cast(GtkTextIter ptr,where_))
    end sub

    sub TGtkTextView.deleteMark overload ( byval m as TGtkTextMark )
        gtk_text_buffer_delete_mark(textbuffer_,cast(GtkTextMark ptr,m))
    end sub

    sub TGtkTextView.deleteMark ( byref m_name as string )
        gtk_text_buffer_delete_mark_by_name(textbuffer_,m_name)
    end sub

    function TGtkTextView.getMark ( byref m_name as string ) as TGtkTextMark
        return TGtkTextMark(gtk_text_buffer_get_mark(textbuffer_,m_name))
    end function

    function TGtkTextView.getInsert() as TGtkTextMark
        return TGtkTextMark(gtk_text_buffer_get_insert(textbuffer_))
    end function

    function TGtkTextView.getSelectionBound() as TGtkTextMark
        return TGtkTextMark(gtk_text_buffer_get_selection_bound(textbuffer_))
    end function

    property TGtkTextView.Scrollable() as TGtkScrollable
        return scrollwindow_
    end property

    operator TGtkTextView.cast() as GtkWidget Pointer
        return cast(GtkWidget ptr,scrollwindow_)
    end operator

    property TGtkTextView.TextView() as GtkWidget Pointer
        return id_
    end property

    property TGtkTextView.Tags() as TGtkTextTagTable
        return texttagtable_
    end property

    property TGtkTextView.Text( byval text_ as string )
        gtk_text_buffer_set_text( textbuffer_, @text_, len(text_) )
    end property

    property TGtkTextView.Text() as string
        dim as GtkTextIter text_s, text_e

        gtk_text_buffer_get_bounds(  textbuffer_, @text_s, @text_e)

        return *(gtk_text_buffer_get_text( textbuffer_, @text_s, @text_e, false ))
    end property

    property TGtkTextView.Font( byval font_ as string )
        if (not (font_ = "" )) then
            gtk_widget_modify_font( GTK_WIDGET( id_ ), pango_font_description_from_string( font_ ) )
        end if
    end property

    property TGtkTextView.buffer() as GtkTextBuffer ptr
        return textbuffer_
    end property

    property TGtkTextView.modified() as gboolean
        return gtk_text_buffer_get_modified(textbuffer_)
    end property

    property TGtkTextView.modified( byval t as gboolean )
        gtk_text_buffer_set_modified(textbuffer_,t)
    end property

    property TGtkTextView.lineCount() as integer
        return gtk_text_buffer_get_line_count(textbuffer_)
    end property

    property TGtkTextView.charCount() as integer
        return gtk_text_buffer_get_char_count(textbuffer_)
    end property

    sub TGtkTextView.insertAt( byref start_ as TGtkTextIter, byref txt as string )
        gtk_text_buffer_insert(textbuffer_,cast(GtkTextIter ptr,start_),txt,len(txt))
    end sub

    sub TGtkTextView.insertAtCursor( byref txt as string )
        gtk_text_buffer_insert_at_cursor(textbuffer_,txt,len(txt))
    end sub

    function TGtkTextView.slice( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter ) as string
        return *gtk_text_buffer_get_slice(textbuffer_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_),false)
    end function

    function TGtkTextView.selectionBounds( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter ) as gboolean
        return gtk_text_buffer_get_selection_bounds(textbuffer_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_))
    end function

    sub TGtkTextView.deleteFrom( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
        gtk_text_buffer_delete(textbuffer_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_))
    end sub

    sub TGtkTextView.placeCursor( byref where_ as TGtkTextIter )
        gtk_text_buffer_place_cursor(textbuffer_,cast(GtkTextIter ptr,where_))
    end sub

    sub TGtkTextView.applyTag( byref name_ as string, byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
        gtk_text_buffer_apply_tag_by_name(textbuffer_,name_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_))
    end sub

    sub TGtkTextView.removeTag( byref name_ as string, byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
        gtk_text_buffer_remove_tag_by_name(textbuffer_,name_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_))
    end sub

    sub TGtkTextView.removeAllTags( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
        gtk_text_buffer_remove_all_tags(textbuffer_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_))
    end sub

    property TGtkTextView.startIter() as TGtkTextIter
        dim r as GtkTextIter
        gtk_text_buffer_get_start_iter(textbuffer_,@r)
        return TGtkTextIter(@r)
    end property

    property TGtkTextView.endIter() as TGtkTextIter
        dim r as GtkTextIter
        gtk_text_buffer_get_end_iter(textbuffer_,@r)
        return TGtkTextIter(@r)
    end property

    function TGtkTextView.iterAtLine( byval l as integer ) as TGtkTextIter
        dim r as GtkTextIter
        gtk_text_buffer_get_iter_at_line(textbuffer_,@r,l)
        return TGtkTextIter(@r)
    end function

    function TGtkTextView.iterAtLineOffset( byval l as integer, byval o as integer ) as TGtkTextIter
        dim r as GtkTextIter
        gtk_text_buffer_get_iter_at_line_offset(textbuffer_,@r,l,o)
        return TGtkTextIter(@r)
    end function

    function TGtkTextView.iterAtLineIndex( byval l as integer, byval i as integer ) as TGtkTextIter
        dim r as GtkTextIter
        gtk_text_buffer_get_iter_at_line_offset(textbuffer_,@r,l,i)
        return TGtkTextIter(@r)
    end function
    
    function TGtkTextView.iterAtOffset( byval o as integer ) as TGtkTextIter
        dim r as GtkTextIter
        gtk_text_buffer_get_iter_at_offset(textbuffer_,@r,o)
        return TGtkTextIter(@r)
    end function

end namespace
