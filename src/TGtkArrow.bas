#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkArrow( byval a as GtkArrowType = GTK_ARROW_NONE, byval s as GtkShadowType = GTK_SHADOW_NONE )
        id_ = gtk_arrow_new(a,s)
        init()
    end constructor

    operator TGtkArrow.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkArrow.set( byval a as GtkArrowType, byval s as GtkShadowType = GTK_SHADOW_NONE )
        gtk_arrow_set(GTK_ARROW(id_),a,s)
    end sub

end namespace
