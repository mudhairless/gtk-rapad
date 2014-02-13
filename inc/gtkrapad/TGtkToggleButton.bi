namespace GtkRapad

type TGtkToggleButton

    declare constructor
    declare constructor( byref lbl as string )

    declare property mode() as gboolean
    declare property mode( byval draw_indicator as gboolean )

    declare property state() as gboolean
    declare property state( byval active as gboolean )

    declare property inconsistent() as gboolean
    declare property inconsistent( byval s as gboolean )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
