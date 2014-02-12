#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkFixed)

    constructor TGtkFixed
        id_ = gtk_fixed_new()
        init()
    end constructor

    operator TGtkFixed.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkFixed.MoveChild( byval obj as GtkWidget Pointer, byval x as integer, byval y as integer )
        gtk_fixed_move( GTK_FIXED(id_), obj, x, y)
    end sub

end namespace
