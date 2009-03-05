#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    dim shared mnu_key(31) as string
    dim shared mnu_item(31) as GtkWidget pointer

    function mnu_freeindex() as integer
        dim i as integer

        for i = 0 to 31
            if (mnu_key(i) = "") then return i
        next i

        return -1
    end function

    sub mnu_del_by_key( byval k_ as string)
        dim i as integer

        for i = 0 to 31
            if (mnu_key(i) = k_) then
                mnu_key(i) = ""
            end if
        next i
    end sub

    sub mnu_del_by_ptr( byval m_ as GtkWidget pointer)
        dim i as integer

        for i = 0 to 31
            if (mnu_item(i) = m_) then
                mnu_key(i) = ""
            end if
        next i
    end sub

    sub mnu_add( byval k_ as string, byval m_ as GtkWidget pointer)
        dim i as integer

        i = mnu_freeindex()

        if (i > -1) then
            mnu_key(i) = k_
            mnu_item(i) = m_
        end if
    end sub

    function mnu_get_ptr_by_key( byval k_ as string ) as GtkWidget pointer
        dim i as integer

        for i = 0 to 31
            if (mnu_key(i) = k_) then
                return mnu_item(i)
            end if
        next i
    end function

    constructor TGtkMenuBar( )
        id_ = gtk_menu_bar_new()
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkMenuBar.cast() as GtkWidget pointer
        return id_
    end operator

    sub TGtkMenuBar.AddMenuMain( byref key_ as string, byval label_ as string )
        var item_ = gtk_menu_item_new_with_mnemonic( label_ )

        mnu_add( key_, item_ )

        'gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), item_)
        gtk_widget_show ( item_ )
    end sub

    sub TGtkMenuBar.AddMenuSub( byref pkey_ as string, byref key_ as string, byref label_ as string, byval aMethod as GtkGenericCallback )
        dim p_ as GtkWidget pointer
        dim subitem_ as TGtkMenuItem

        p_ = mnu_get_ptr_by_key( pkey_ )

        print p_

        if (p_ > 0) then
            subitem_.SetName( key_ )
            subitem_.SetLabel( label_ )
            subitem_.Activate( aMethod )

            gtk_widget_show ( subitem_ )
            gtk_menu_shell_append(GTK_MENU_SHELL( p_ ), subitem_ )
        end if
    end sub

    'sub TGtkMenuBar.AddMenu( byref name_ as string, byval _widget_ as GtkWidget pointer )
        'var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        'gtk_widget_show ( _item_ )
        'gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        'gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), _item_)
    'end sub

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
