namespace GtkRapad

type TGtkExpander

    declare constructor( byref lbl as string = "" )

    declare property expanded() as gboolean
    declare property expanded( byval t as gboolean )

    declare property spacing() as integer
    declare property spacing( byval v as integer )

    declare property text() as string
    declare property text( byref t as string )

    declare property useUnderline() as gboolean
    declare property useUnderline( byval t as gboolean )

    declare property useMarkup() as gboolean
    declare property useMarkup( byval t as gboolean )

    declare property label() as GtkWidget ptr
    declare property label( byval l as GtkWidget ptr )

    declare property labelFill() as gboolean
    declare property labelFill( byval t as gboolean )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
