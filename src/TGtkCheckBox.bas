#include once "gtkrapad/gtkrapad.bi"
namespace GtkRapad

    COMMON_FUNCS(TGtkCheckBox)

    BUTTON_COMMON(TGtkCheckBox)

    TOGGLE_BUTTON_COMMON(TGtkCheckBox)

    constructor TGtkCheckBox()
        id_ = gtk_check_button_new_with_mnemonic( "" )
        init()
    end constructor

    constructor TGtkCheckBox( byref lbl as string )
        id_ = gtk_check_button_new_with_mnemonic( lbl )
        init()
    end constructor

    operator TGtkCheckBox.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkCheckBox.SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback)

        var action = ""

        select case ev
        case TOGGLED
            action = "toggled"

        case else
            RuntimeError("Checkbox event not implemented.")

        end select

        connect( action, aMethod )

    end sub

end namespace
