#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkVSeparator)

    constructor TGtkVSeparator
        id_ = gtk_Vseparator_new()
        init()
    end constructor

    operator TGtkVSeparator.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
