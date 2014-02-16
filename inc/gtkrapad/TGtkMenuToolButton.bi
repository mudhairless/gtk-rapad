namespace GtkRapad

type TGtkMenuToolButton

    declare constructor( byval icon_w as GtkWidget ptr = 0, byref txt as string = "" )
    declare constructor( byref stock_id as string )

    declare property menu() as GtkWidget ptr
    declare property menu( byval i as GtkWidget ptr )

    declare property arrowTooltip( byref txt as string )

    DECLARE_TOOL_BUTTON_COMMON()
    DECLARE_TOOL_ITEM_COMMON()
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
