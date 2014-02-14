#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkSpinButton)

    constructor TGtkSpinButton( byval min_ as double = 0.0, byval max_ as double = 10.0, byval step_ as double = 1.0 )
        id_ = gtk_spin_button_new_with_range(min_,max_,step_)
        init()
    end constructor

    operator TGtkSpinButton.cast() as GtkWidget ptr
        return id_
    end operator

    sub TGtkSpinButton.setRange( byval min_ as double, byval max_ as double )
        gtk_spin_button_set_range(GTK_SPIN_BUTTON(id_),min_,max_)
    end sub

    sub TGtkSpinButton.setStep( byval step_ as double )
        gtk_spin_button_set_increments(GTK_SPIN_BUTTON(id_),step_,step_*2)
    end sub

    property TGtkSpinButton.digits() as uinteger
        return gtk_spin_button_get_digits(GTK_SPIN_BUTTON(id_))
    end property

    property TGtkSpinButton.digits( byval n as uinteger )
        gtk_spin_button_set_digits(GTK_SPIN_BUTTON(id_),n)
    end property

    function TGtkSpinButton.intValue() as integer
        return gtk_spin_button_get_value_as_int(GTK_SPIN_BUTTON(id_))
    end function

    property TGtkSpinButton.value() as double
        return gtk_spin_button_get_value(GTK_SPIN_BUTTON(id_))
    end property

    property TGtkSpinButton.value( byval v as double )
        gtk_spin_button_set_value(GTK_SPIN_BUTTON(id_),v)
    end property

    property TGtkSpinButton.onlyNumeric() as gboolean
        return gtk_spin_button_get_numeric(GTK_SPIN_BUTTON(id_))
    end property

    property TGtkSpinButton.onlyNumeric( byval t as gboolean )
        gtk_spin_button_set_numeric(GTK_SPIN_BUTTON(id_),t)
    end property

    property TGtkSpinButton.wrap() as gboolean
        return gtk_spin_button_get_wrap(GTK_SPIN_BUTTON(id_))
    end property

    property TGtkSpinButton.wrap( byval t as gboolean )
        gtk_spin_button_set_wrap(GTK_SPIN_BUTTON(id_),t)
    end property

end namespace
