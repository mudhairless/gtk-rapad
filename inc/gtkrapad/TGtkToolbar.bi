namespace GtkRapad

type TGtkToolbar

    declare constructor
    declare operator cast() as GtkWidget ptr

    declare sub insert(byval i as TGtkToolItem, byval p as integer )
    declare sub prepend( byval i as TGtkToolItem )
    declare sub append( byval i as TGtkToolItem )

    declare property length() as integer
    declare function at( byval i as integer ) as TGtkToolItem

    declare property showOverflowMenu() as gboolean
    declare property showOverflowMenu( byval t as gboolean )

    declare property orientation() as GtkOrientation
    declare property orientation( byval t as GtkOrientation )

    declare property style() as GtkToolbarStyle
    declare property style( byval t as GtkToolbarStyle )

    declare sub resetStyle()

    declare property iconSize() as GtkIconSize
    declare property iconSize( byval t as GtkIconSize )

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
