#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad
    COMMON_FUNCS(TGtkLinkButton)

    constructor TGtkLinkButton( byref uri_ as string = "" )
        id_ = gtk_link_button_new(uri_)
        init()
    end constructor

    constructor TGtkLinkButton( byref url_ as string, byref lbl as string )
        id_ = gtk_link_button_new_with_label(url_,lbl)
        init()
    end constructor

    property TGtkLinkButton.uri() as string
        return *gtk_link_button_get_uri(GTK_LINK_BUTTON(id_))
    end property

    property TGtkLinkButton.uri( byref t as string )
        gtk_link_button_set_uri(GTK_LINK_BUTTON(id_),t)
    end property

    property TGtkLinkButton.visited() as gboolean
        return gtk_link_button_get_visited(GTK_LINK_BUTTON(id_))
    end property

    property TGtkLinkButton.visited( byval t as gboolean )
        gtk_link_button_set_visited(GTK_LINK_BUTTON(id_),t)
    end property

    operator TGtkLinkbutton.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
