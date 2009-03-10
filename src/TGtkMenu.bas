#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMenu()
        id_ = gtk_menu_new()
        objname_ = str( (gtype_ & "-" & id_) )
        'g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkMenu.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkMenu.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            g_free( id_ )
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkMenu.AddChild( byval pGtkChild as GtkWidget pointer )
        gtk_menu_shell_append (GTK_MENU_SHELL( id_ ), pGtkChild)
        gtk_widget_show( pGtkChild )
    end sub

    sub TGtkMenu.SetName( byref newName as string )
        objname_ = newName
        'g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkMenu.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

end namespace
