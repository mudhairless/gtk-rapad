#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkVPaned)

    constructor TGtkVPaned
        id_ = gtk_vpaned_new()
        init()
    end constructor

    operator TGtkVPaned.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
