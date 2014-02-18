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

    constructor TGtkButton( byref stock_id as string, byval t as gboolean )
        id_ = gtk_button_new_from_stock(stock_id)
        init()
    end constructor

    operator TGtkButton.cast() as GtkWidget Pointer
        return id_
    end operator

    property TGtkButton.label( byref newCaption as string )
        gtk_button_set_label( GTK_BUTTON( id_ ), newCaption)
    end property

    property TGtkButton.label() as string
        return *(gtk_button_get_label( GTK_BUTTON( id_ )))
    end property


    property TGtkButton.relief() as GtkReliefStyle
        return gtk_button_get_relief(GTK_BUTTON(id_))
    end property

    property TGtkButton.relief( byval t as GtkReliefStyle )
        gtk_button_set_relief(GTK_BUTTON(id_),t)
    end property

    property TGtkButton.useStock() as gboolean
        return gtk_button_get_use_stock(GTK_BUTTON(id_))
    end property

    property TGtkButton.useStock( byval t as gboolean )
        gtk_button_set_use_stock(GTK_BUTTON(id_),t)
    end property

    property TGtkButton.useUnderline() as gboolean
        return gtk_button_get_use_underline(GTK_BUTTON(id_))
    end property

    property TGtkButton.useUnderline( byval t as gboolean )
        gtk_button_set_use_underline(GTK_BUTTON(id_),t)
    end property

    property TGtkButton.focusOnClick() as gboolean
        return gtk_button_get_focus_on_click(GTK_BUTTON(id_))
    end property

    property TGtkButton.focusOnClick( byval t as gboolean )
        gtk_button_set_focus_on_click(GTK_BUTTON(id_),t)
    end property

    property TGtkButton.image() as GtkWidget ptr
        return gtk_button_get_image(GTK_BUTTON(id_))
    end property

    property TGtkButton.image( byval t as GtkWidget ptr )
        gtk_button_set_image(GTK_BUTTON(id_),t)
    end property

    property TGtkButton.imagePosition() as GtkPositionType
        return gtk_button_get_image_position(GTK_BUTTON(id_))
    end property

    property TGtkButton.imagePosition( byval t as GtkPositionType )
        gtk_button_set_image_position(GTK_BUTTON(id_),t)
    end property

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
