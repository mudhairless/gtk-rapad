#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTextChildAnchor
        id_ = gtk_text_child_anchor_new()
    end constructor

    property TGtkTextChildAnchor.widgets() as GList ptr
        return gtk_text_child_anchor_get_widgets(id_)
    end property

    property TGtkTextChildAnchor.deleted() as gboolean
        return gtk_text_child_anchor_get_deleted(id_)
    end property

    operator TGtkTextChildAnchor.cast() as GtkTextChildAnchor ptr
        return id_
    end operator

end namespace
