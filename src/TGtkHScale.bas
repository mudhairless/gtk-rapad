#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkHScale)

    constructor TGtkHScale( byval min_ as double = 0.0, byval max_ as double = 0.0, byval step_ as double = 1.0 )
        id_ = gtk_hscale_new_with_range(min_,max_,step_)
        init()
    end constructor

    property TGtkHScale.numDigits() as integer
        return gtk_scale_get_digits(GTK_SCALE(id_))
    end property

    property TGtkHScale.numDigits( byval n as integer )
        gtk_scale_set_digits(GTK_SCALE(id_),n)
    end property

    property TGtkHScale.drawValue() as gboolean
        return gtk_scale_get_draw_value(GTK_SCALE(id_))
    end property

    property TGtkHScale.drawValue( byval t as gboolean )
        gtk_scale_set_draw_value(GTK_SCALE(id_),t)
    end property

    property TGtkHScale.valuePosition() as GtkPositionType
        return gtk_scale_get_value_pos(GTK_SCALE(id_))
    end property

    property TGtkHScale.valuePosition( byval p as GtkPositionType )
        gtk_scale_set_value_pos(GTK_SCALE(id_),p)
    end property

    sub TGtkHScale.addMark( byval v as double, byval p as GtkPositionType, byref markup as string )
        gtk_scale_add_mark(GTK_SCALE(id_),v,p,markup)
    end sub

    sub TGtkHScale.clearMarks()
        gtk_scale_clear_marks(GTK_SCALE(id_))
    end sub

    sub TGtkHScale.setRange( byval min_ as double, byval max_ as double )
        gtk_range_set_range(GTK_RANGE(id_),min_,max_)
    end sub

    sub TGtkHScale.setStep( byval v as double )
        gtk_range_set_increments(GTK_RANGE(id_),v,v*2)
    end sub
    
    property TGtkHScale.value() as double
        return gtk_range_get_value(GTK_RANGE(id_))
    end property

    property TGtkHScale.value( byval v as double )
        gtk_range_set_value(GTK_RANGE(id_),v)
    end property

    operator TGtkHScale.cast() as GtkWidget ptr
        return id_
    end operator

end namespace
