#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkMenuItem)

    constructor TGtkMenuItem( byref _label_ as string )
        id_ = gtk_menu_item_new_with_mnemonic( _label_ )
        init()
    end constructor

    constructor TGtkMenuItem()
        id_ = gtk_menu_item_new()
        init()
    end constructor

    operator TGtkMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkMenuItem.SetLabel( byref _label_ as string )
        gtk_menu_item_set_label( GTK_MENU_ITEM(id_),_label_)
    end sub

    sub TGtkMenuItem.SetSubMenu( byval _child_ as GtkWidget pointer )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM(id_), _child_ )
    end sub

    sub TGtkMenuItem.Activate( byval aMethod as GtkGenericCallback )
        connect("activate", aMethod )
    end sub

end namespace
