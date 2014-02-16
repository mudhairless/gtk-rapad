#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkCheckMenuItem)

    MENU_ITEM_COMMON(TGtkCheckMenuItem)

    constructor TGtkCheckMenuItem
        id_ = gtk_check_menu_item_new()
        init()
    end constructor

    property TGtkCheckMenuItem.active() as gboolean
        return gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(id_))
    end property

    property TGtkCheckMenuItem.active( byval t as gboolean )
        gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(id_),t)
    end property

    property TGtkCheckMenuItem.drawAsRadio() as gboolean
        return gtk_check_menu_item_get_draw_as_radio(GTK_CHECK_MENU_ITEM(id_))
    end property

    property TGtkCheckMenuItem.drawAsRadio( byval t as gboolean )
        gtk_check_menu_item_set_draw_as_radio(GTK_CHECK_MENU_ITEM(id_),t)
    end property

end namespace
