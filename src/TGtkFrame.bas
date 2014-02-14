#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkFrame)

    constructor TGtkFrame( byref l as string = "" )
        id_ = gtk_frame_new(l)
        init()
    end constructor

    operator TGtkFrame.cast() as GtkWidget ptr
        return id_
    end operator

    property TGtkFrame.label() as string
        return *gtk_frame_get_label(GTK_FRAME(id_))
    end property

    property TGtkFrame.label( byref l as string )
        gtk_frame_set_label(GTK_FRAME(id_),l)
    end property

    sub TGtkFrame.getAlignment( byref x as single = 0.0f, byref y as single = 0.0f )
        gtk_frame_get_label_align(GTK_FRAME(id_),@x,@y)
    end sub

    sub TGtkFrame.setAlignment( byval x as single = 0.0f, byval y as single = 0.0f )
        gtk_frame_set_label_align(GTK_FRAME(id_),x,y)
    end sub

    property TGtkFrame.shadowType() as GtkShadowType
        return gtk_frame_get_shadow_type(GTK_FRAME(id_))
    end property

    property TGtkFrame.shadowType( byval s as GtkShadowType )
        gtk_frame_set_shadow_type(GTK_FRAME(id_),s)
    end property

    function TGtkFrame.getLabelWidget() as GtkWidget ptr
        return gtk_frame_get_label_widget(GTK_FRAME(id_))
    end function

end namespace
