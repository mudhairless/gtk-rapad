#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkToggleButton)

    TOGGLE_BUTTON_COMMON(TGtkToggleButton)

    BUTTON_COMMON(TGtkToggleButton)

    constructor TGtkToggleButton
        id_ = gtk_toggle_button_new()
        init()
    end constructor

    constructor TGtkToggleButton ( byref lbl as string )
        id_ = gtk_toggle_button_new_with_mnemonic(lbl)
        init()
    end constructor

    operator TGtkToggleButton.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
