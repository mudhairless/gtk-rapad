#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRadioMenuItem)

    MENU_ITEM_COMMON(TGtkRadioMenuItem)

    operator TGtkRadioMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

    constructor TGtkRadioMenuItem
        id_ = gtk_radio_menu_item_new(0)
        _group = gtk_radio_menu_item_get_group(GTK_RADIO_MENU_ITEM(id_))
        init()
    end constructor

    property TGtkRadioMenuItem.group() as GSList ptr
        return gtk_radio_menu_item_get_group(GTK_RADIO_MENU_ITEM(id_))
    end property

    property TGtkRadioMenuItem.group( byval g as GSList ptr )
        gtk_radio_menu_item_set_group(GTK_RADIO_MENU_ITEM(id_),g)
    end property

    property TGtkRadioMenuItem.active() as gboolean
        return gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(id_))
    end property

    property TGtkRadioMenuItem.active( byval t as gboolean )
        gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(id_),t)
    end property

end namespace
