#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMenuItem( byref _label_ as string )
        id_ = gtk_menu_item_new_with_mnemonic( _label_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    constructor TGtkMenuItem()
        'do set the id here, i appears it may only be possible to get
        'the label of a menu item when its created, this class can be
        'initialized w/o a label.

        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

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

    sub TGtkMenuItem.SetLabel( byref _label_ as string )
        if (id_ = 0) then
            id_ = gtk_menu_item_new_with_mnemonic( _label_ )
        end if
    end sub

    sub TGtkMenuItem.SetSubMenu( byval _child_ as GtkWidget pointer )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM(id_), _child_ )
    end sub

    sub TGtkMenuItem.Activate( byval aMethod as GtkGenericCallback )
        g_signal_connect( GTK_OBJECT( id_ ), "activate", G_CALLBACK( aMethod ), 0 )
    end sub

end namespace
