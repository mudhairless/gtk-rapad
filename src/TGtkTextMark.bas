#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    TEXT_MARK_COMMON(TGtkTextMark)

    constructor TGtkTextMark( byref name_ as string, byval left_gravity as gboolean )
        id_ = gtk_text_mark_new(name_,left_gravity)
    end constructor

    constructor TGtkTextMark( byval i as GtkTextMark ptr )
        id_ = i
    end constructor

    operator TGtkTextMark.cast() as GtkTextMark ptr
        return id_
    end operator

end namespace
