#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkFixed
        id_ = gtk_fixed_new()
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )

        g_object_set( G_OBJECT( id_ ), "rapad.name" )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkFixed.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkFixed.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkFixed.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkFixed.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkFixed.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkFixed.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkFixed.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkFixed.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkFixed.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkFixed.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkFixed.GetParent() as GtkWidget Pointer
        return parent_
    end function

    sub TGtkFixed.MoveChild( byval obj as GtkWidget Pointer, byval x as integer, byval y as integer )
        gtk_fixed_move( GTK_FIXED(id_), obj, x, y)
    end sub

end namespace
