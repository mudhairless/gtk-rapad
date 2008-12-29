#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

constructor TGtkMenuBar( )

    id_ = gtk_menu_bar_new()

end constructor

sub TGtkMenuBar.AddMenu( byref name_ as string, byval _widget_ as GtkWidget ptr )

    var _item_ = gtk_menu_item_new_with_mnemonic(name_)
    gtk_widget_show (_item_)

    gtk_menu_item_set_submenu (GTK_MENU_ITEM (_item_), _widget_)
    gtk_menu_bar_append (GTK_MENU_BAR (id_), _item_)

end sub

sub TGtkMenuBar.SetParent( byval prnt_ as GtkWidget ptr )

    parent_ = prnt_
    gtk_container_add( GTK_CONTAINER( parent_ ), GTK_WIDGET( id_ ) )

end sub

end namespace
