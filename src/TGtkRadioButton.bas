#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRadioButton)

    constructor TGtkRadioButton()
        id_ = gtk_radio_button_new_with_mnemonic( 0, "")
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), 0 )
        init()
    end constructor

    constructor TGtkRadioButton( byref label as string )
        id_ = gtk_radio_button_new_with_mnemonic( 0, label)
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), 0 )
        init()
    end constructor

    operator TGtkRadioButton.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkRadioButton.SetLabel( byref label as string )
        gtk_button_set_label( GTK_BUTTON( id_ ), label )
    end sub

    function TGtkRadioButton.GetLabel( ) as string
        return *(gtk_button_get_label( GTK_BUTTON( id_ )))
    end function

    sub TGtkRadioButton.SetChecked( byval b as gboolean )
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), b )
    end sub

    sub TGtkRadioButton.Group( byval wid as GtkWidget pointer )
        list_ = gtk_radio_button_get_group( GTK_RADIO_BUTTON( wid ) )
        gtk_radio_button_set_group( GTK_RADIO_BUTTON( id_ ), list_ )
    end sub

    function TGtkRadioButton.isChecked() as gboolean
        return gtk_toggle_button_get_active( GTK_TOGGLE_BUTTON( id_ ) )
    end function

    sub TGtkRadioButton.SetEvent( byval ev as TGtkEvents, byval aMethod as gtkGenericCallback )

        var action = ""

        select case ev
            case TOGGLED
                action = "toggled"

            case else
                RuntimeError("Radio Button event not implemented.")
        end select

        connect( action, aMethod )
    end sub

end namespace
