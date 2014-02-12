#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkMenu)
    
    constructor TGtkMenu( )
        id_ = gtk_menu_new()
        init()
    end constructor

    operator TGtkMenu.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkMenu.AddChild( byval pGtkChild as GtkWidget pointer )
        gtk_menu_shell_append (GTK_MENU_SHELL( id_ ), pGtkChild)
        gtk_widget_show( pGtkChild )
    end sub

end namespace
