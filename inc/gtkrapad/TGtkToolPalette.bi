namespace GtkRapad

type TGtkToolPalette

    declare constructor

    declare function getExclusive( byval t as TGtkToolItemGroup ) as gboolean
    declare sub setExclusive(byval t as TGtkToolItemGroup, byval b as gboolean )

    declare function getExpand( byval t as TGtkToolItemGroup ) as gboolean
    declare sub setExpand( byval t as TGtkToolItemGroup, byval b as gboolean )

    declare function getGroupPos( byval t as TGtkToolItemGroup ) as integer
    declare sub setGroupPos( byval t as TGtkToolItemGroup, byval i as integer )

    declare property iconSize() as GtkIconSize
    declare property iconSize( byval t as GtkIconSize )

    declare sub resetIconSize()

    declare property style() as GtkToolbarStyle
    declare property style( byval t as GtkToolbarStyle )

    declare sub resetStyle()

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
