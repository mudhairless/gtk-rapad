namespace GtkRapad

type TGtkVScale

    declare constructor( byval min_ as double = 0.0, byval max_ as double = 10.0, byval step_ as double = 1.0 )

    declare property numDigits() as integer
    declare property numDigits( byval n as integer )

    declare property drawValue() as gboolean
    declare property drawValue( byval t as gboolean )

    declare property valuePosition() as GtkPositionType
    declare property valuePosition( byval p as GtkPositionType )

    declare sub addMark( byval v as double, byval p as GtkPositionType, byref markup as string )
    declare sub clearMarks()

    declare sub setRange( byval min_ as double, byval max_ as double )
    declare sub setStep( byval v as double )

    declare property value() as double
    declare property value( byval v as double )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
