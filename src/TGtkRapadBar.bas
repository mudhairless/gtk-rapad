#include once "gtkrapad/TGtkRapadBar.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRapadBar)

    constructor TGtkRapadBar
        id_ = gtk_menu_bar_new()
        init()
    end constructor

    operator TGtkRapadBar.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkRapadBar.ResizeMainMenuArray( byval size_ as uinteger )
        if (size_ <= 0) then
            deallocate( __pArrMnuMain )

            __pArrMnuMain_Count = 0

            return
        end if

        __pArrMnuMain = reallocate(__pArrMnuMain, __pArrMnuMain_Count * SizeOf( TGtkMenuItem ))
    end sub

    function TGtkRapadBar.GetMenuAssociationIndex( byval name_ as string ) as integer
        dim x as integer

        if ( __pArrMnuMain_Count = 0 ) then return 0

        for x = 1 to __pArrMnuMain_Count
            if ( __pArrMnuMain[__pArrMnuMain_Count].GetName() = name_ ) then
                return x
            end if
        next x
    end function

    sub TGtkRapadBar.CreateMenuAssociation( byval name_ as string, byval item_ as TGtkMenuItem )
        __pArrMnuMain_Count += 1

        ResizeMainMenuArray( __pArrMnuMain_Count )

        __pArrMnuMain[__pArrMnuMain_Count] = item_

        'print __pArrMnuMain_Count & ": "; __pArrMnuMain[__pArrMnuMain_Count].GetName()
    end sub

    sub TGtkRapadBar.AddChild( byval cwid_ as TGtkMenuItem )
        gtk_menu_shell_append( GTK_MENU_SHELL( id_ ), cwid_ )
        gtk_widget_show( cwid_ )
    end sub

    sub TGTkRapadBar.CreateMenu( byval name_ as string, byval label_ as string )
        dim mnumain_ as TGtkMenuItem = TGtkMenuItem( label_ )

        mnumain_.SetName( name_ )

        AddChild( mnumain_ )
        CreateMenuAssociation( name_, mnumain_ )
    end sub

    sub TGTkRapadBar.CreateMenuChild( byval parent_ as string, byval name_ as string, byval label_ as string, byval aMethod as GtkGenericCallback )
        dim x as integer

        x = GetMenuAssociationIndex( parent_ )
        if (x = 0) then
            RuntimeError("TGTkRapadBar.CreateMenuChild :: No parent with the name `" & parent_ & "` could be located.")
            return
        end if



        'print x & ": "; __pArrMnuMain[x].GetName()
    end sub

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
