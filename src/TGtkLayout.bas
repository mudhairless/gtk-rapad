#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkLayout)

    constructor TGtkLayout
        id_ = gtk_layout_new(0,0)
        init()
    end constructor

    sub TGtkLayout.put( byval child as GtkWidget ptr, byval x as uinteger, byval y as uinteger )
        gtk_layout_put(GTK_LAYOUT(id_),child,x,y)
    end sub

    sub TGtkLayout.move( byval child as GtkWidget ptr, byval x as uinteger, byval y as uinteger )
        gtk_layout_move(GTK_LAYOUT(id_),child,x,y)
    end sub

    sub TGtkLayout.setSize( byval w as uinteger, byval h as uinteger )
        gtk_layout_set_size(GTK_LAYOUT(id_),w,h)
    end sub

    sub TGtkLayout.getSize( byref w as uinteger, byref h as uinteger )
        gtk_layout_get_size(GTK_LAYOUT(id_),@w,@h)
    end sub

    property TGtkLayout.hadjustment() as TGtkAdjustment
        return gtk_layout_get_hadjustment(GTK_LAYOUT(id_))
    end property

    property TGtkLayout.hadjustment( byref t as TGtkAdjustment )
        gtk_layout_set_hadjustment(GTK_LAYOUT(id_),GTK_ADJUSTMENT(cast(GtkObject ptr,t)))
    end property

    property TGtkLayout.vadjustment() as TGtkAdjustment
        return gtk_layout_get_vadjustment(GTK_LAYOUT(id_))
    end property

    property TGtkLayout.vadjustment( byref t as TGtkAdjustment )
        gtk_layout_set_vadjustment(GTK_LAYOUT(id_),GTK_ADJUSTMENT(cast(GtkObject ptr,t)))
    end property

    property TGtkLayout.binWindow() as GdkWindow ptr
        return gtk_layout_get_bin_window(GTK_LAYOUT(id_))
    end property

end namespace
