#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRecentChooserMenu)

    RECENT_CHOOSER_COMMON(TGtkRecentChooserMenu)

    constructor TGtkRecentChooserMenu
        id_ = gtk_recent_chooser_menu_new_for_manager(gtk_recent_manager_get_default())
        init()
    end constructor

    operator TGtkRecentChooserMenu.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkRecentChooserMenu.showNumbers() as gboolean
        return gtk_recent_chooser_menu_get_show_numbers(GTK_RECENT_CHOOSER_MENU(id_))
    end property

    property TGtkRecentChooserMenu.showNumbers( byval t as gboolean )
        gtk_recent_chooser_menu_set_show_numbers(GTK_RECENT_CHOOSER_MENU(id_),t)
    end property

end namespace
