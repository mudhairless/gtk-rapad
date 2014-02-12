#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkSpinner)

    constructor TGtkSpinner()
        id_ = gtk_spinner_new()
        init()
    end constructor

    sub TGtkSpinner.start()
        gtk_spinner_start(GTK_SPINNER(id_))
    end sub

    sub TGtkSpinner.stop()
        gtk_spinner_stop(GTK_SPINNER(id_))
    end sub

    operator TGtkSpinner.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
