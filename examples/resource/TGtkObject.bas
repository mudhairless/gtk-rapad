#include once "gtkrapad/gtkrapad.bi"


namespace GtkRapad

    constructor TGtkObject
        'id_ = gtk_button_new_with_label( "" )
        'gtype_ = GetGtkWidgetType( id_ )
        'objname_ = str( (gtype_ & "-" & id_) )
        'g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkObject.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkObject.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkObject.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkObject.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkObject.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkObject.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkObject.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkObject.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkObject.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkObject.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkObject.GetParent() as GtkWidget Pointer
        return parent_
    end function

    sub TGtkObject.SetEvent( byval ev as TGtkEvents, byval aMethod as GtkGenericCallback )

        'var action = ""

        'select case ev
            'case MOUSE_ENTER
                'action = "enter"
            'case MOUSE_LEAVE
                'action = "leave"
            'case MOUSE_UP
                'action = "released"
            'case MOUSE_DOWN
                'action = "pressed"
            'case MOUSE_CLICK
                'action = "clicked"
            'case else
                'exit sub
        'end select

        'g_signal_connect( GTK_OBJECT( id_ ), action, G_CALLBACK( aMethod ), 0 )

    end sub

end namespace
