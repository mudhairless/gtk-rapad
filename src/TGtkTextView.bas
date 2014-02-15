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

    constructor TGtkTextView( byval b as GtkTextBuffer ptr )
        texttagtable_ = gtk_text_tag_table_new()
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

    property TGtkTextView.Tags() as GtkTextTagTable ptr
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

    property TGtkTextView.buffer( byval b as GtkTextBuffer ptr )
        g_object_unref(textbuffer_)
        textbuffer_ = b
        gtk_text_view_set_buffer(GTK_TEXT_VIEW(id_),b)
    end property

end namespace
