#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkSeparatorMenuItem)

    constructor TGtkSeparatorMenuItem
        id_ = gtk_separator_menu_item_new()
        init()
    end constructor

    operator TGtkSeparatorMenuItem.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
