#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkProgressBar)

    constructor TGtkProgressBar
        id_ = gtk_progress_bar_new()
        init()
    end constructor
    
    sub TGtkProgressBar.pulse()
        gtk_progress_bar_pulse(GTK_PROGRESS_BAR(id_))
    end sub
    
    sub TGtkProgressBar.setPulseStep( byval v as double )
        gtk_progress_bar_set_pulse_step(GTK_PROGRESS_BAR(id_),v)
    end sub
    
    function TGtkProgressBar.getPulseStep() as double
        return gtk_progress_bar_get_pulse_step(GTK_PROGRESS_BAR(id_))
    end function
    
    sub TGtkProgressBar.setText( byref t as string )
        gtk_progress_bar_set_text(GTK_PROGRESS_BAR(id_),t)
    end sub
    
    function TGtkProgressBar.getText() as string
        var res = gtk_progress_bar_get_text(GTK_PROGRESS_BAR(id_))
        var ret = ""
        ret = *res
        return ret
    end function

    sub TGtkProgressBar.setFraction( byval v as double )
        gtk_progress_bar_set_fraction(GTK_PROGRESS_BAR(id_),v)
    end sub
    
    function TGtkProgressBar.getFraction() as double
        return gtk_progress_bar_get_fraction(GTK_PROGRESS_BAR(id_))
    end function

    sub TGtkProgressBar.setOrientation( byval d as GtkProgressBarOrientation )
        gtk_progress_bar_set_orientation(GTK_PROGRESS_BAR(id_),d)
    end sub
    
    function TGtkProgressBar.getOrientation() as GtkProgressBarOrientation
        return gtk_progress_bar_get_orientation(GTK_PROGRESS_BAR(id_))
    end function

end namespace
