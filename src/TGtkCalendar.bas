#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkCalendar)

    constructor TGtkCalendar
        id_ = gtk_calendar_new()
        init()
    end constructor

    operator TGtkCalendar.cast() as GtkWidget ptr
        return id_
    end operator

    function TGtkCalendar.selectMonth( byval month_ as uinteger, byval year_ as uinteger ) as gboolean
        return gtk_calendar_select_month(GTK_CALENDAR(id_),month_,year_)
    end function

    sub TGtkCalendar.selectDay( byval day_ as uinteger )
        gtk_calendar_select_day(GTK_CALENDAR(id_),day_)
    end sub

    function TGtkCalendar.markDay( byval day_ as uinteger ) as gboolean
        return gtk_calendar_mark_day(GTK_CALENDAR(id_),day_)
    end function

    function TGtkCalendar.unMarkDay( byval day_ as uinteger ) as gboolean
        return gtk_calendar_unmark_day(GTK_CALENDAR(id_),day_)
    end function

    sub TGtkCalendar.clearMarks()
        gtk_calendar_clear_marks(GTK_CALENDAR(id_))
    end sub

    sub TGtkCalendar.getDate( byref year_ as uinteger, byref month_ as uinteger, byref day_ as uinteger )
        gtk_calendar_get_date(GTK_CALENDAR(id_),@year_,@month_,@day_)
    end sub

    property TGtkCalendar.displayOptions() as GtkCalendarDisplayOptions
        return gtk_calendar_get_display_options(GTK_CALENDAR(id_))
    end property

    property TGtkCalendar.displayOptions( byval v as GtkCalendarDisplayOptions )
        gtk_calendar_set_display_options(GTK_CALENDAR(id_),v)
    end property

end namespace
