#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMenuItem ( )

    end constructor

    constructor TGtkMenuItem( byref _label_ as string )

        id_ = gtk_menu_item_new_with_mnemonic( _label_ )

    end constructor

    sub TGtkMenuItem.SetLabel( byref _label_ as string )

    if id_ = 0 then

        id_ = gtk_menu_item_new_with_mnemonic( _label_ )

    end if

    end sub

    sub TGtkMenuItem.SetSubMenu( byval _child_ as GtkWidget ptr )

        gtk_menu_item_set_submenu( GTK_MENU_ITEM(id_), _child_ )

    end sub

    sub TGtkMenuItem.Activate( byval aMethod as gtkGenericCallback, byval x as any ptr = 0 )

        g_signal_connect( GTK_OBJECT( id_ ), "activate", G_CALLBACK( aMethod ), x )

    end sub

    operator TGtkMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
