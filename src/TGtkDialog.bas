#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkDialog)

    DIALOG_COMMON(TGtkDialog)

    constructor TGtkDialog
        id_ = gtk_dialog_new()
        init()
    end constructor

end namespace
