#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    constructor TGtkRadioButton()
        id_ = gtk_radio_button_new_with_mnemonic( 0, "")
        gtype_ = GetGtkWidgetType( id_ )
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), 0 )
    end constructor

    constructor TGtkRadioButton( byref label as string )
        id_ = gtk_radio_button_new_with_mnemonic( 0, label)
        gtype_ = GetGtkWidgetType( id_ )
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), 0 )
    end constructor

    operator TGtkRadioButton.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkRadioButton.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkRadioButton.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRadioButton.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRadioButton.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRadioButton.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRadioButton.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkRadioButton.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkRadioButton.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------

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

        g_signal_connect( GTK_OBJECT( id_ ), action, G_CALLBACK( aMethod ), 0 )
    end sub

end namespace
