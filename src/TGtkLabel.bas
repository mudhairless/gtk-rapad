#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkLabel)

    constructor TGtkLabel()
        id_ = gtk_label_new( "" )
        init()
    end constructor

    constructor TGtkLabel( byref contents as string )
        id_ = gtk_label_new( contents )
        init()
    end constructor

    operator TGtkLabel.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkLabel.SetText( byref contents as string )
        gtk_label_set_text( GTK_LABEL(id_), contents )
    end sub

    function TGtkLabel.GetText( ) as string
        return *(gtk_label_get_text( GTK_LABEL(id_) ))
    end function

end namespace
