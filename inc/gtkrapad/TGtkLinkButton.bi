namespace GtkRapad

type TGtkLinkButton

    declare constructor( byref uri_ as string = "" )
    declare constructor( byref url_ as string, byref lbl as string )

    declare property uri() as string
    declare property uri( byref t as string )

    declare property visited() as gboolean
    declare property visited( byval t as gboolean )

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
