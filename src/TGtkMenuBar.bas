#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkMenuBar)

    constructor TGtkMenuBar( )
        id_ = gtk_menu_bar_new()
        init()
    end constructor

    operator TGtkMenuBar.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkMenuBar.append( byref name_ as string, byval _widget_ as GtkWidget pointer )
        var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        gtk_widget_show ( _item_ )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), _item_)
    end sub

    sub TGtkMenuBar.append( byval t as GtkWidget ptr )
        gtk_widget_show(t)
        gtk_menu_shell_append(GTK_MENU_SHELL(id_),t)
    end sub

    sub TGtkMenuBar.prepend( byref name_ as string, byval _widget_ as GtkWidget pointer )
        var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        gtk_widget_show ( _item_ )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_shell_prepend( GTK_MENU_SHELL( id_ ), _item_)
    end sub

    sub TGtkMenuBar.prepend( byval t as GtkWidget ptr )
        gtk_widget_show(t)
        gtk_menu_shell_prepend(GTK_MENU_SHELL(id_),t)
    end sub

    sub TGtkMenuBar.insert( byref name_ as string, byval _widget_ as GtkWidget pointer, byval p as integer )
        var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        gtk_widget_show ( _item_ )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_shell_insert( GTK_MENU_SHELL( id_ ), _item_,p)
    end sub

    sub TGtkMenuBar.insert( byval t as GtkWidget ptr, byval p as integer )
        gtk_widget_show(t)
        gtk_menu_shell_insert(GTK_MENU_SHELL(id_),t,p)
    end sub

end namespace
