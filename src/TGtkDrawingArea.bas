#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkDrawingArea)

    constructor TGtkDrawingArea
        id_ = gtk_drawing_area_new()
        init()
    end constructor

    sub TGtkDrawingArea.setSize( byval w as integer, byval h as integer )
        gtk_widget_set_size_request(id_,w,h)
    end sub

    operator TGtkDrawingArea.cast() as GtkWidget ptr
        return id_
    end operator

    function TGtkDrawingArea.raw() as GdkWindow ptr
        return id_->window
    end function

end namespace
