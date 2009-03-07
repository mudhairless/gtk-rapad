#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    dim shared __rapadbar_main_menu_name() as string
    dim shared __rapadbar_main_menu_item() as TGtkMenuItem

    constructor TGtkRapadBar
        id_ = gtk_menu_bar_new()
        gtype_ = GetGtkWidgetType( id_ )
        objname_ = str( (gtype_ & "-" & id_) )
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end constructor

    operator TGtkRapadBar.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkRapadBar.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    'sub CreateMenuAssociation( byval name_ as string, byval item_ as TGtkMenuItem )
    sub TGtkRapadBar.CreateMenuAssociation( byval name_ as string, byval item_ as GtkWidget pointer )

        'dim x as integer
        'dim xitem as TGtkMenuItem = TGtkMenuItem()

        'xitem.associate( item_ )

        'x = ubound( __rapadbar_main_menu_item ) + 1

        'redim preserve __rapadbar_main_menu_name(x) as string
        'redim preserve __rapadbar_main_menu_item(x) as TGtkMenuItem

        '__rapadbar_main_menu_name(x) = name_
        '__rapadbar_main_menu_item(x) = xitem
    end sub

    sub TGtkRapadBar.AddChild( byval cwid_ as GtkWidget pointer )
        gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), cwid_ )
        gtk_widget_show( GTK_WIDGET( cwid_ ) )
    end sub

    sub TGTkRapadBar.CreateMenu( byval name_ as string, byval label_ as string )
        dim mnumain_ as TGTkMenuItem = TGtkMenuItem( label_ )

        mnumain_.SetName( name_ )

        AddChild( mnumain_ )
        'CreateMenuAssociation( name_, mnumain_ )
    end sub

    sub TGtkRapadBar.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRapadBar.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRapadBar.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRapadBar.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRapadBar.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRapadBar.SetName( byref newName as string )
        objname_ = newName
        g_object_set_data( G_OBJECT( id_ ), "rapad.name", @objname_ )
    end sub

    function TGtkRapadBar.GetName() as string
        dim p as string pointer
        dim s as string

        p = g_object_get_data( G_OBJECT( id_ ), "rapad.name" )
        s = *p

        return s
    end function

    sub TGtkRapadBar.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkRapadBar.GetParent() as GtkWidget Pointer
        return parent_
    end function

    sub TGtkRapadBar.SetEvent( byval ev as TGtkEvents, byval aMethod as GtkGenericCallback )

        'var action = ""

        'select case ev
            'case MOUSE_ENTER
                'action = "enter"
            'case MOUSE_LEAVE
                'action = "leave"
            'case MOUSE_UP
                'action = "released"
            'case MOUSE_DOWN
                'action = "pressed"
            'case MOUSE_CLICK
                'action = "clicked"
            'case else
                'exit sub
        'end select

        'g_signal_connect( GTK_OBJECT( id_ ), action, G_CALLBACK( aMethod ), 0 )

    end sub

end namespace
