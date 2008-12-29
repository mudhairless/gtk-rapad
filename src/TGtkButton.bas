#include once "gtkrapad/gtkrapad.bi"

'------------+------------+------------+------------+------------+----------'
'
'   Properties
'
'------------+------------+------------+------------+------------+----------'

namespace GtkRapad

    constructor TGtkButton
        id_ = gtk_button_new_with_label( "" )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    constructor TGtkButton( byref caption_ as string )
        id_ = gtk_button_new_with_label( caption_ )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkButton.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkButton.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkButton.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkButton.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkButton.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkButton.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkButton.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkButton.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkButton.GetParent() as GtkWidget Pointer
        return parent_
    end function

    sub TGtkButton.SetCaption( byref newCaption as string )
        gtk_button_set_label( GTK_BUTTON( id_ ), newCaption)
    end sub

    function TGtkButton.GetCaption() as string
        return *(gtk_button_get_label( GTK_BUTTON( id_ )))
    end function

    sub TGtkButton.SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

        var action = ""

        select case ev

        case MOUSE_ENTER
            action = "enter"

        case MOUSE_LEAVE
            action = "leave"

        case MOUSE_UP
            action = "released"

        case MOUSE_DOWN
            action = "pressed"

        case MOUSE_CLICK
            action = "clicked"

        case else
            exit sub

        end select

        g_signal_connect( GTK_OBJECT( id_ ), action, G_CALLBACK( aMethod ), 0 )


    end sub

    sub TGtkButton.SetMouseEnter( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_ENTER, aMethod )
    end sub

    sub TGtkButton.SetMouseLeave( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_LEAVE, aMethod )
    end sub

    sub TGtkButton.SetMouseUp( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_UP, aMethod )
    end sub

    sub TGtkButton.SetMouseDown( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_DOWN, aMethod )
    end sub

    sub TGtkButton.SetMouseClick( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_CLICK, aMethod )
    end sub

end namespace
