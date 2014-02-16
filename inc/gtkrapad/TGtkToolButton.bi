namespace GtkRapad

type TGtkToolButton

    declare constructor( byval icon_w as GtkWidget ptr = 0, byref txt as string = "" )
    declare constructor( byref stock_id as string )

    declare property label() as string
    declare property label( byref txt as string )

    declare property useUnderline() as gboolean
    declare property useUnderline( byval t as gboolean )

    declare property stockID() as string
    declare property stockID( byref s as string )

    declare property iconName() as string
    declare property iconName( byref s as string )

    declare property iconWidget() as GtkWidget ptr
    declare property iconWidget( byval i as GtkWidget ptr )

    declare property labelWidget() as GtkWidget ptr
    declare property labelWidget( byval i as GtkWidget ptr )

    DECLARE_TOOL_ITEM_COMMON()
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
