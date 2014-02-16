#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkMenuItem)

    constructor TGtkMenuItem( byref _label_ as string )
        id_ = gtk_menu_item_new_with_mnemonic( _label_ )
        init()
    end constructor

    constructor TGtkMenuItem()
        id_ = gtk_menu_item_new()
        gtk_menu_item_set_use_underline(GTK_MENU_ITEM(id_),true)
        init()
    end constructor

    operator TGtkMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

    MENU_ITEM_COMMON(TGtkMenuItem)

    sub TGtkMenuItem.Activate( byval aMethod as GtkGenericCallback )
        connect("activate", aMethod )
    end sub

end namespace
