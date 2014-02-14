namespace GtkRapad

type TGtkCalendar
    declare constructor
    declare operator cast() as GtkWidget ptr

    declare function selectMonth( byval month_ as uinteger, byval year_ as uinteger ) as gboolean
    declare sub selectDay( byval day_ as uinteger )

    declare function markDay( byval day_ as uinteger ) as gboolean
    declare function unMarkDay( byval day_ as uinteger ) as gboolean
    declare sub clearMarks()

    declare sub getDate( byref year_ as uinteger, byref month_ as uinteger, byref day_ as uinteger )

    declare property displayOptions() as GtkCalendarDisplayOptions
    declare property displayOptions( byval v as GtkCalendarDisplayOptions )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
