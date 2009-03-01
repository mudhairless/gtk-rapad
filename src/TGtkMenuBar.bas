#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    function LocateParentMenuByKey( byval key_ as string ) as GtkWidget pointer
        return null
    end function

    constructor TGtkMenuBar( )
        id_ = gtk_menu_bar_new()
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkMenuBar.cast() as GtkWidget pointer
        return id_
    end operator

    sub TGtkMenuBar.AddSubMenu( byref parentkey_ as string, byref key_ as string, byref label_ as string, byval aMethod as GtkGenericCallback )
        dim subitem_ as TGtkMenuItem

        subitem_.SetName( key_ )
        subitem_.SetLabel( label_ )
        subitem_.Activate( aMethod )

        gtk_widget_show ( subitem_ )
        gtk_menu_bar_append( GTK_MENU_BAR( id_ ), subitem_)
    end sub

    sub TGtkMenuBar.AddMenuX( byref key_ as string, byref label_ as string )
        dim item_ as TGtkMenuItem

        item_.SetName( key_ )
        item_.SetLabel( label_ )

        gtk_widget_show ( item_ )
        gtk_menu_bar_append( GTK_MENU_BAR( id_ ), item_)
    end sub

    sub TGtkMenuBar.AddMenu( byref name_ as string, byval _widget_ as GtkWidget pointer )
        var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        gtk_widget_show ( _item_ )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_bar_append( GTK_MENU_BAR( id_ ), _item_)
    end sub

    sub TGtkMenuBar.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkMenuBar.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkMenuBar.SetParent( byval prnt_ as GtkWidget pointer )
        parent_ = prnt_
        gtk_container_add( GTK_CONTAINER( parent_ ), GTK_WIDGET( id_ ) )
    end sub

end namespace
