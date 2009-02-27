'
'   TGtkTextView.bas
'
'   Code for a simple text display widget.
'
'   Formatted text will be able to be added in the form of flags that
'   can be toggled on or off.
'
'   If a flag, such as bold or underline, is toggled on when text is
'   inserted that it will be applied with that formatting
'


#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    'function TGtkTextView_CallbackTest cdecl() as GtkGenericCallback
    '    print "TGtkTextView_CallbackTest cdecl()"
    'end function

    constructor TGtkTextView
        texttagtable_ = gtk_text_tag_table_new()
        textbuffer_ = gtk_text_buffer_new( texttagtable_ )
        id_ = gtk_text_view_new_with_buffer( textbuffer_ )
        scrollwindow_ = gtk_scrolled_window_new( null, null )

        gtk_container_add( GTK_CONTAINER( scrollwindow_ ), GTK_WIDGET( id_ ) )

        'we're going to connect to this signal and see if we make the
        'text view change the font on text as its inserted.

        'g_signal_connect( GTK_OBJECT( id_ ), "insert-at-cursor", G_CALLBACK( TGtkTextView_CallbackTest ), null )
    end constructor

    operator TGtkTextView.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkTextView.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkTextView.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTextView.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTextView.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTextView.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTextView.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkTextView.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkTextView.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkTextView.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET( scrollwindow_ ) )
    end sub

    function TGtkTextView.GetParent() as GtkWidget Pointer
        return parent_
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
        dim as GtkTextTag pointer ntt
        dim as GtkTextIter text_s, text_e

        gtk_text_buffer_get_bounds( textbuffer_, @text_s, @text_e)

        ntt = gtk_text_buffer_create_tag( textbuffer_, null, "font", @font_, null )

        gtk_text_buffer_apply_tag( textbuffer_, ntt, @text_s, @text_e )
    end sub

end namespace
