namespace GtkRapad

type TGtkToolItemGroup
    declare constructor ( byref txt as string = "" )
    declare operator cast() as GtkWidget ptr

    declare property length() as integer
    declare function at( byval i as uinteger ) as TGtkToolItem

    declare property label() as string
    declare property label( byref txt as string )

    declare property labelWidget() as GtkWidget ptr
    declare property labelWidget( byval i as GtkWidget ptr )

    declare property collapsed() as gboolean
    declare property collapsed( byval t as gboolean )

    declare property headerRelief() as GtkReliefStyle
    declare property headerRelief( byval t as GtkReliefStyle )

    declare property ellipsize() as PangoEllipsizeMode
    declare property ellipsize( byval t as PangoEllipsizeMode )

    declare sub prepend( byval i as TGtkToolItem )
    declare sub insert( byval i as TGtkToolItem, byval p as integer )
    declare sub append( byval i as TGtkToolItem )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
