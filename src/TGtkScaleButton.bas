#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkScaleButton)

    constructor TGtkScaleButton ( byval size as GtkIconSize = GTK_ICON_SIZE_INVALID, _
                         byval minimum as double = 0.0, _
                         byval maximum as double = 0.0, _
                         byval stp as double = 0.0, _
                         byval icns as zstring ptr ptr = 0 )
        id_ = gtk_scale_button_new(size,minimum,maximum,stp,icns)
        init()
    end constructor

    property TGtkScaleButton.adjustment() as GtkAdjustment ptr
        return gtk_scale_button_get_adjustment(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkScaleButton.adjustment( byval a as GtkAdjustment ptr )
        gtk_scale_button_set_adjustment(GTK_SCALE_BUTTON(id_),a)
    end property

    property TGtkScaleButton.value() as double
        return gtk_scale_button_get_value(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkScaleButton.value( byval v as double )
        gtk_scale_button_set_value(GTK_SCALE_BUTTON(id_),v)
    end property

    property TGtkScaleButton.orientation() as GtkOrientation
        return gtk_scale_button_get_orientation(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkScaleButton.orientation( byval o as GtkOrientation )
        gtk_scale_button_set_orientation(GTK_SCALE_BUTTON(id_),o)
    end property

    property TGtkScaleButton.popup() as GtkWidget ptr
        return gtk_scale_button_get_popup(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkScaleButton.plusButton() as GtkWidget ptr
        return gtk_scale_button_get_plus_button(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkScaleButton.minusButton() as GtkWidget ptr
        return gtk_scale_button_get_minus_button(GTK_SCALE_BUTTON(id_))
    end property

    property TGtkScaleButton.icons( byval icos as zstring ptr ptr )
        gtk_scale_button_set_icons(GTK_SCALE_BUTTON(id_),icos)
    end property

    operator TGtkScaleButton.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
