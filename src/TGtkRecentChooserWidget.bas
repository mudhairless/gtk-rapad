#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRecentChooserWidget)

    RECENT_CHOOSER_COMMON(TGtkRecentChooserWidget)

    constructor TGtkRecentChooserWidget
        id_ = gtk_recent_chooser_widget_new_for_manager(gtk_recent_manager_get_default())
        init()
    end constructor

    operator TGtkRecentChooserWidget.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
