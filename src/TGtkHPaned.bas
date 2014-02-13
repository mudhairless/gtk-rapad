#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkHPaned)

    constructor TGtkHPaned
        id_ = gtk_hpaned_new()
        init()
    end constructor

    operator TGtkHPaned.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
