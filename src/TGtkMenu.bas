#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkMenu( )
        id_ = gtk_menu_new()
    end constructor

    sub TGtkMenu.AddChild( byval pGtkChild as GtkWidget ptr )
        gtk_menu_shell_append (GTK_MENU_SHELL( id_ ), pGtkChild)
        gtk_widget_show( pGtkChild )
    end sub

    operator TGtkMenu.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
