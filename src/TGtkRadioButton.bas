#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkRadioButton)

    constructor TGtkRadioButton()
        id_ = gtk_radio_button_new_with_mnemonic( 0, "")
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), 0 )
        init()
    end constructor

    constructor TGtkRadioButton( byref label_ as string )
        id_ = gtk_radio_button_new_with_mnemonic( 0, label_)
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), 0 )
        init()
    end constructor

    constructor TGtkRadioButton( byref t as TGtkRadioButton )
        id_ = gtk_radio_button_new_with_mnemonic_from_widget(GTK_RADIO_BUTTON(cast(GtkWidget ptr,t)),"")
        init()
    end constructor

    constructor TGtkRadioButton( byval t as TGtkRadioButton, byref label_ as string )
        id_ = gtk_radio_button_new_with_mnemonic_from_widget(GTK_RADIO_BUTTON(cast(GtkWidget ptr,t)),label_)
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

    property TGtkRadioButton.group() as GSList ptr
        return gtk_radio_button_get_group( GTK_RADIO_BUTTON( id_ ) )
    end property

    property TGtkRadioButton.group( byval g as GSList ptr )
        gtk_radio_button_set_group(GTK_RADIO_BUTTON(id_),g)
    end property

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
