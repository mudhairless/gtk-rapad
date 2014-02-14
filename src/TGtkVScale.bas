#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkVScale)

    constructor TGtkVScale( byval min_ as double = 0.0, byval max_ as double = 10.0, byval step_ as double = 1.0 )
        id_ = gtk_vscale_new_with_range(min_,max_,step_)
        init()
    end constructor

    property TGtkVScale.numDigits() as integer
        return gtk_scale_get_digits(GTK_SCALE(id_))
    end property

    property TGtkVScale.numDigits( byval n as integer )
        gtk_scale_set_digits(GTK_SCALE(id_),n)
    end property

    property TGtkVScale.drawValue() as gboolean
        return gtk_scale_get_draw_value(GTK_SCALE(id_))
    end property

    property TGtkVScale.drawValue( byval t as gboolean )
        gtk_scale_set_draw_value(GTK_SCALE(id_),t)
    end property

    property TGtkVScale.valuePosition() as GtkPositionType
        return gtk_scale_get_value_pos(GTK_SCALE(id_))
    end property

    property TGtkVScale.valuePosition( byval p as GtkPositionType )
        gtk_scale_set_value_pos(GTK_SCALE(id_),p)
    end property

    sub TGtkVScale.addMark( byval v as double, byval p as GtkPositionType, byref markup as string )
        gtk_scale_add_mark(GTK_SCALE(id_),v,p,markup)
    end sub

    sub TGtkVScale.clearMarks()
        gtk_scale_clear_marks(GTK_SCALE(id_))
    end sub

    sub TGtkVScale.setRange( byval min_ as double, byval max_ as double )
        gtk_range_set_range(GTK_RANGE(id_),min_,max_)
    end sub

    sub TGtkVScale.setStep( byval v as double )
        gtk_range_set_increments(GTK_RANGE(id_),v,v*2)
    end sub
    
    property TGtkVScale.value() as double
        return gtk_range_get_value(GTK_RANGE(id_))
    end property

    property TGtkVScale.value( byval v as double )
        gtk_range_set_value(GTK_RANGE(id_),v)
    end property

    operator TGtkVScale.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
