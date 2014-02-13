#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToggleButton)

    constructor TGtkToggleButton
        id_ = gtk_toggle_button_new()
        init()
    end constructor

    constructor TGtkToggleButton ( byref lbl as string )
        id_ = gtk_toggle_button_new_with_mnemonic(lbl)
        init()
    end constructor

    property TGtkToggleButton.mode() as gboolean
        return gtk_toggle_button_get_mode(GTK_TOGGLE_BUTTON(id_))
    end property

    property TGtkToggleButton.mode( byval draw_indicator as gboolean )
        gtk_toggle_button_set_mode(GTK_TOGGLE_BUTTON(id_),draw_indicator)
    end property

    property TGtkToggleButton.state() as gboolean
        return gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(id_))
    end property

    property TGtkToggleButton.state( byval active as gboolean )
        gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(id_),active)
    end property

    property TGtkToggleButton.inconsistent() as gboolean
        return gtk_toggle_button_get_inconsistent(GTK_TOGGLE_BUTTON(id_))
    end property

    property TGtkToggleButton.inconsistent( byval s as gboolean )
        gtk_toggle_button_set_inconsistent(GTK_TOGGLE_BUTTON(id_),s)
    end property

    operator TGtkToggleButton.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
