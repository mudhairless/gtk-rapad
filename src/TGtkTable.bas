#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkTable)

    constructor TGtkTable( byval w as uinteger = 0, byval h as uinteger = 0, byval homog as gboolean = true )
        id_ = gtk_table_new(w,h,homog)
        init()
    end constructor

    operator TGtkTable.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkTable.setSize( byval w as uinteger, byval h as uinteger )
        gtk_table_resize(GTK_TABLE(id_),w,h)
    end sub

    sub TGtkTable.getSize( byref w as uinteger, byref h as uinteger )
        gtk_table_get_size(GTK_TABLE(id_),@w,@h)
    end sub

    sub TGtkTable.attach overload(     byval c as GtkWidget ptr, _
                             byval l as uinteger, _
                             byval r as uinteger, _
                             byval t as uinteger, _
                             byval b as uinteger, _
                             byval xop as GtkAttachOptions, _
                             byval yop as GtkAttachOptions, _
                             byval xp as uinteger, _
                             byval yp as uinteger )
        gtk_table_attach(GTK_TABLE(id_),c,l,r,t,b,xop,yop,xp,yp)
    end sub

    sub TGtkTable.attach( byval c as GtkWidget ptr, _
                         byval l as uinteger, _
                         byval r as uinteger, _
                         byval t as uinteger, _
                         byval b as uinteger )
        gtk_table_attach_defaults(GTK_TABLE(id_),c,l,r,t,b)
    end sub

end namespace
