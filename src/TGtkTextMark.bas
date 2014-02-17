#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkTextMark( byref name_ as string, byval left_gravity as gboolean )
        id_ = gtk_text_mark_new(name_,left_gravity)
    end constructor

    constructor TGtkTextMark( byval i as GtkTextMark ptr )
        id_ = i
    end constructor

    property TGtkTextMark.visible() as gboolean
        return gtk_text_mark_get_visible(id_)
    end property

    property TGtkTextMark.visible( byval t as gboolean )
        gtk_text_mark_set_visible(id_,t)
    end property

    property TGtkTextMark.name() as string
        return *gtk_text_mark_get_name(id_)
    end property

    property TGtkTextMark.buffer() as GtkTextBuffer ptr
        return gtk_text_mark_get_buffer(id_)
    end property

    property TGtkTextMark.leftGravity() as gboolean
        return gtk_text_mark_get_left_gravity(id_)
    end property

    property TGtkTextMark.deleted() as gboolean
        return gtk_text_mark_get_deleted(id_)
    end property

    operator TGtkTextMark.cast() as GtkTextMark ptr
        return id_
    end operator

end namespace
