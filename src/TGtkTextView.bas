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

    sub TGtkTextView.deleteFrom( byref start_ as TGtkTextIter, byref end_ as TGtkTextIter )
        gtk_text_buffer_delete(textbuffer_,cast(GtkTextIter ptr,start_),cast(GtkTextIter ptr,end_))
    end sub


end namespace
