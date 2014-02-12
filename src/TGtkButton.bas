#include once "gtkrapad/gtkrapad.bi"


namespace GtkRapad

    COMMON_FUNCS(TGtkButton)

    constructor TGtkButton
        id_ = gtk_button_new_with_label( "" )
        init()
    end constructor

    constructor TGtkButton( byref caption_ as string )
        id_ = gtk_button_new_with_label( caption_ )
        init()
    end constructor

    operator TGtkButton.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkButton.SetCaption( byref newCaption as string )
        gtk_button_set_label( GTK_BUTTON( id_ ), newCaption)
    end sub

    function TGtkButton.GetCaption() as string
        return *(gtk_button_get_label( GTK_BUTTON( id_ )))
    end function

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
