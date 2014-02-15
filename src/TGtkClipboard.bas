#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkClipboard()
        id_ = gtk_clipboard_get(cast(GdkAtom,GUINT_TO_POINTER(69)))
    end constructor

    constructor TGtkClipboard( byval d as GdkDisplay ptr )
        id_ = gtk_clipboard_get_for_display(d,cast(GdkAtom,GUINT_TO_POINTER(69)))
    end constructor

    property TGtkClipboard.display() as GdkDisplay ptr
        return gtk_clipboard_get_display(id_)
    end property

    sub TGtkClipboard.clear()
        gtk_clipboard_clear(id_)
    end sub

    property TGtkClipboard.text( byref t as string )
        gtk_clipboard_set_text(id_,t,len(t))
    end property

    property TGtkClipboard.text() as string
        if gtk_clipboard_wait_is_text_available(id_) = true then
            return *gtk_clipboard_wait_for_text(id_)
        else
            return ""
        end if
    end property

    property TGtkClipboard.image( byval i as GdkPixbuf ptr )
        gtk_clipboard_set_image(id_,i)
    end property

    property TGtkClipboard.image() as GdkPixbuf ptr
        if gtk_clipboard_wait_is_image_available(id_) = true then
            return gtk_clipboard_wait_for_image(id_)
        else
            return 0
        end if
    end property

    sub TGtkClipboard.store()
        gtk_clipboard_store(id_)
    end sub

end namespace
