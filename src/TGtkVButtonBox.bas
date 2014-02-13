#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkVButtonBox)

    constructor TGtkVButtonBox
        id_ = gtk_vbutton_box_new()
        init()
    end constructor

    operator TGtkVButtonBox.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
