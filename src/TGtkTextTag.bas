#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkTextTag)

    constructor TGtkTextTag( byref n as string )
        id_ = cast(GtkWidget ptr,gtk_text_tag_new(n))
        init()
    end constructor

    constructor TGtkTextTag( byval i as GtkTextTag ptr)
        id_ = cast(GtkWidget ptr,i)
        init()
    end constructor

    property TGtkTextTag.priority() as integer
        return gtk_text_tag_get_priority(GTK_TEXT_TAG(id_))
    end property

    property TGtkTextTag.priority( byval p as integer )
        gtk_text_tag_set_priority(GTK_TEXT_TAG(id_),p)
    end property

    operator TGtkTextTag.cast() as GtkTextTag ptr
        return GTK_TEXT_TAG(id_)
    end operator

end namespace
