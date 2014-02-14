namespace GtkRapad

type TGtkSpinButton

    declare constructor( byval min_ as double = 0.0, byval max_ as double = 10.0, byval step_ as double = 1.0 )
    declare operator cast() as GtkWidget ptr

    declare sub setRange( byval min_ as double, byval max_ as double )
    declare sub setStep( byval step_ as double )

    declare property digits() as uinteger
    declare property digits( byval n as uinteger )

    declare function intValue() as integer

    declare property value() as double
    declare property value( byval v as double )

    declare property onlyNumeric() as gboolean
    declare property onlyNumeric( byval t as gboolean )

    declare property wrap() as gboolean
    declare property wrap( byval t as gboolean )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
