#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMenuBar( )
        id_ = gtk_menu_bar_new()
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkMenuBar.cast() as GtkWidget pointer
        return id_
    end operator

    sub TGtkMenuBar.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            g_free( id_ )
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkMenuBar.AddMenu( byref name_ as string, byval _widget_ as GtkWidget pointer )
        var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        gtk_widget_show ( _item_ )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), _item_)
    end sub

    sub TGtkMenuBar.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkMenuBar.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkMenuBar.SetParent( byval prnt_ as GtkWidget pointer )
        parent_ = prnt_
        gtk_container_add( GTK_CONTAINER( parent_ ), GTK_WIDGET( id_ ) )
    end sub

end namespace
