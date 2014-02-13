#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkAlignment)

    operator TGtkAlignment.cast() as GtkWidget ptr
        return id_
    end operator

    constructor TGtkAlignment (  byval xalign as uinteger = 0, _
                            byval yalign as uinteger = 0, _
                            byval xscale as uinteger = 0, _
                            byval yscale as uinteger = 0 )
        id_ = gtk_alignment_new(xalign,yalign,xscale,yscale)
        init()
    end constructor

    sub TGtkAlignment.set(  byval xalign as uinteger = 0, _
                            byval yalign as uinteger = 0, _
                            byval xscale as uinteger = 0, _
                            byval yscale as uinteger = 0 )
        gtk_alignment_set(GTK_ALIGNMENT(id_),xalign,yalign,xscale,yscale)
    end sub

    sub TGtkAlignment.setPadding( byval xalign as uinteger = 0, _
                            byval yalign as uinteger = 0, _
                            byval xscale as uinteger = 0, _
                            byval yscale as uinteger = 0 )
        gtk_alignment_set_padding(GTK_ALIGNMENT(id_),xalign,yalign,xscale,yscale)
    end sub

    sub TGtkAlignment.getPadding( byref xalign as uinteger, _
                            byref yalign as uinteger, _
                            byref xscale as uinteger, _
                            byref yscale as uinteger )
        gtk_alignment_get_padding(GTK_ALIGNMENT(id_),@xalign,@yalign,@xscale,@yscale)
    end sub

end namespace
