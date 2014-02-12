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
        texttagtable_ = gtk_text_tag_table_new()
        textbuffer_ = gtk_text_buffer_new( texttagtable_ )
        id_ = gtk_text_view_new_with_buffer( textbuffer_ )

        gtk_container_add( GTK_CONTAINER( cast(GtkWidget ptr,scrollwindow_) ), GTK_WIDGET( id_ ) )
        init()
    end constructor

    function TGtkTextView.getScrollable() as TGtkScrollable ptr
        return @scrollwindow_
    end function

    operator TGtkTextView.cast() as GtkWidget Pointer
        return cast(GtkWidget ptr,scrollwindow_)
    end operator

    function TGtkTextView.TextView() as GtkWidget Pointer
        return id_
    end function

    sub TGtkTextView.SetText( byval text_ as string )
        gtk_text_buffer_set_text( textbuffer_, @text_, len(text_) )
    end sub

    function TGtkTextView.GetText() as string
        dim as GtkTextIter text_s, text_e

        gtk_text_buffer_get_bounds(  textbuffer_, @text_s, @text_e)

        return *(gtk_text_buffer_get_text( textbuffer_, @text_s, @text_e, false ))
    end function

    sub TGtkTextView.SetFont( byval font_ as string )
        if (not (font_ = "" )) then
            gtk_widget_modify_font( GTK_WIDGET( id_ ), pango_font_description_from_string( font_ ) )
        end if
    end sub

end namespace
