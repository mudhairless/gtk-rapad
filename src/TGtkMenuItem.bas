#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMenuItem( byref _label_ as string )
        id_ = gtk_menu_item_new_with_mnemonic( _label_ )
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    constructor TGtkMenuItem()
        'you should never create an instance of this class w/o the
        'lable unless you plan to use its Associate() method

        id_ = gtk_menu_item_new_with_mnemonic( "" )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    sub TGtkMenuItem.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            g_free( id_ )
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    operator TGtkMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkMenuItem.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkMenuItem.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkMenuItem.SetSubMenu( byval cwid_ as GtkWidget pointer )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( id_ ), cwid_ )
    end sub

    sub TGtkMenuItem.Activate( byval aMethod as GtkGenericCallback )
        g_signal_connect( GTK_OBJECT( id_ ), "activate", G_CALLBACK( aMethod ), 0 )
    end sub

end namespace
