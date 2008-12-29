#include once "gtkrapad/gtkrapad.bi"
namespace GtkRapad

    constructor TGtkCheckBox()
        id_ = gtk_check_button_new_with_mnemonic( "" )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    constructor TGtkCheckBox( byref lbl as string )
        id_ = gtk_check_button_new_with_mnemonic( lbl )
        gtype_ = GetGtkWidgetType( id_ )
    end constructor

    operator TGtkCheckBox.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkCheckBox.Associate( byval p as GtkWidget pointer )
        'Will assign a new pointer for this class to reference so long
        'as the pointer type is appropriate for this class.

        if ( GetGtkWidgetType( p ) = gtype_ ) then
            id_ = p
        else
            RuntimeError( "Associate() failed - pointer type mismatch" )
        end if
    end sub

    sub TGtkCheckBox.Show()
        gtk_widget_show( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkCheckBox.Hide()
        gtk_widget_hide( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkCheckBox.ShowAll()
        gtk_widget_show_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkCheckBox.HideAll()
        gtk_widget_hide_all( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkCheckBox.Destroy()
        gtk_widget_destroy( GTK_WIDGET( id_ ) )
    end sub

    sub TGtkCheckBox.SetParent( byval p as GtkWidget Pointer )
        parent_ = p
        gtk_container_add( GTK_CONTAINER(parent_), GTK_WIDGET(id_) )
    end sub

    function TGtkCheckBox.GetParent() as GtkWidget Pointer
        return parent_
    end function

    '-----------------------------------------------

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

        g_signal_connect( GTK_OBJECT( id_ ), action, G_CALLBACK( aMethod ), 0 )

    end sub

    sub TGtkCheckBox.SetChecked( byval b as gboolean )
        gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( id_ ), b )
    end sub

    function TGtkCheckBox.isChecked() as gboolean
        return gtk_toggle_button_get_active( GTK_TOGGLE_BUTTON( id_ ) )
    end function

end namespace
