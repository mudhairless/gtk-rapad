#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkMenuBar)

    dim shared mnu_key(31) as string
    dim shared mnu_item(31) as GtkWidget pointer
    dim shared mnu_shell(31) as GtkWidget pointer

    function mnu_freeindex() as integer
        dim i as integer

        for i = 0 to 31
            if (mnu_key(i) = "") then return i
        next i

        return -1
    end function

    sub mnu_del_by_key( byval k_ as string )
        dim i as integer

        for i = 0 to 31
            if (mnu_key(i) = k_) then
                mnu_key(i) = ""
            end if
        next i
    end sub

    sub mnu_del_by_ptr( byval m_ as GtkWidget pointer )
        dim i as integer

        for i = 0 to 31
            if (mnu_item(i) = m_) then
                mnu_key(i) = ""
            end if
        next i
    end sub

    sub mnu_add( byval k_ as string, byval m_ as GtkWidget pointer )
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
        init()
    end constructor

    operator TGtkMenuBar.cast() as GtkWidget pointer
        return id_
    end operator

    'sub TGtkMenuBar.AddMenuMain( byref key_ as string, byval label_ as string )
        'var item_ = gtk_menu_item_new_with_mnemonic( label_ )

        'mnu_add( key_, item_ )

        'gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), item_)
        'gtk_widget_show ( item_ )
    'end sub

    'sub TGtkMenuBar.AddMenuSub( byref pkey_ as string, byref key_ as string, byref label_ as string, byval aMethod as GtkGenericCallback )
        'dim p_ as any pointer
        'dim subitem_ as TGtkMenu

        'p_ = mnu_get_ptr_by_key( pkey_ )

        'print p_

        'if (p_ > 0) then
            'subitem_.SetName( key_ )
            'subitem_.SetLabel( label_ )
            'subitem_.Activate( aMethod )

            'gtk_menu_item_set_submenu( GTK_MENU_ITEM( p_ ), subitem_)

            'gtk_widget_show ( subitem_ )
        'end if
    'end sub

    sub TGtkMenuBar.AddMenu( byref name_ as string, byval _widget_ as GtkWidget pointer )
        var _item_ = gtk_menu_item_new_with_mnemonic( name_ )

        gtk_widget_show ( _item_ )
        gtk_menu_item_set_submenu( GTK_MENU_ITEM( _item_ ), _widget_)
        gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), _item_)
    end sub

end namespace
