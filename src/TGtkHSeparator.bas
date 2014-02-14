#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkHSeparator)

    constructor TGtkHSeparator
        id_ = gtk_hseparator_new()
        init()
    end constructor

    operator TGtkHSeparator.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
