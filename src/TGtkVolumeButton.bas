#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkVolumeButton)

    constructor TGtkVolumeButton
        id_ = gtk_volume_button_new()
        init()
    end constructor

    property TGtkVolumeButton.value() as double
        return gtk_scale_button_get_value(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkVolumeButton.value( byval v as double )
        gtk_scale_button_set_value(GTK_SCALE_BUTTON(id_),v)
    end property

    operator TGtkVolumeButton.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
