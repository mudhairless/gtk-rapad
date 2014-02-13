#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkHButtonBox)

    constructor TGtkHButtonBox
        id_ = gtk_hbutton_box_new()
        init()
    end constructor

    operator TGtkHButtonBox.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
