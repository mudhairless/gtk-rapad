#include once "gtkrapad/gtkrapad.bi"


namespace GtkRapad

    COMMON_FUNCS(TGtkButton)

    BUTTON_COMMON(TGtkButton)

    constructor TGtkButton
        id_ = gtk_button_new_with_label( "" )
        init()
    end constructor

    constructor TGtkButton( byref caption_ as string )
        id_ = gtk_button_new_with_label( caption_ )
        init()
    end constructor

    constructor TGtkButton( byref stock_id as string, byval t as gboolean )
        id_ = gtk_button_new_from_stock(stock_id)
        init()
    end constructor

    operator TGtkButton.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkButton.SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

        var action = ""

        select case ev

        case MOUSE_ENTER
            action = "enter"

        case MOUSE_LEAVE
            action = "leave"

        case MOUSE_UP
            action = "released"

        case MOUSE_DOWN
            action = "pressed"

        case MOUSE_CLICK
            action = "clicked"

        case else
            exit sub

        end select

        connect(action, aMethod )


    end sub

    sub TGtkButton.SetMouseEnter( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_ENTER, aMethod )
    end sub

    sub TGtkButton.SetMouseLeave( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_LEAVE, aMethod )
    end sub

    sub TGtkButton.SetMouseUp( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_UP, aMethod )
    end sub

    sub TGtkButton.SetMouseDown( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_DOWN, aMethod )
    end sub

    sub TGtkButton.SetMouseClick( byval aMethod as gtkGenericCallback )
        this.SetEvent( MOUSE_CLICK, aMethod )
    end sub

end namespace
