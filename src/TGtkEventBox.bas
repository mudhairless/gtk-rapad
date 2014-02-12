#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkEventBox)

    constructor TGtkEventBox
        id_ = gtk_event_box_new()
        init()
    end constructor

    sub TGtkEventBox.setAboveChild( byval t as gboolean )
        gtk_event_box_set_above_child(GTK_EVENT_BOX(id_),t)
    end sub
    
    function TGtkEventBox.getAboveChild( ) as gboolean
        return gtk_event_box_get_above_child(GTK_EVENT_BOX(id_))
    end function
    
    sub TGtkEventBox.setVisibleWindow( byval t as gboolean )
        gtk_event_box_set_visible_window(GTK_EVENT_BOX(id_),t)
    end sub
    
    function TGtkEventBox.getVisibleWindow( ) as gboolean
        return gtk_event_box_get_visible_window(GTK_EVENT_BOX(id_))
    end function

    operator TGtkEventBox.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
