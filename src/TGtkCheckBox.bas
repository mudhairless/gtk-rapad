#include once "gtkrapad/gtkrapad.bi"
namespace GtkRapad

    COMMON_FUNCS(TGtkCheckBox)

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

    sub TGtkCheckBox.SetLabel( byref lbl as string )
        gtk_button_set_label( GTK_BUTTON( id_ ), lbl )
    end sub

    function TGtkCheckBox.GetLabel() as string
        return *(gtk_button_get_label( GTK_BUTTON(id_) ))
    end function

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

    sub TGtkCheckBox.SetChecked( byval b as gboolean )
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), b )
    end sub

    function TGtkCheckBox.isChecked() as gboolean
        return gtk_toggle_button_get_active( GTK_TOGGLE_BUTTON( id_ ) )
    end function

end namespace
