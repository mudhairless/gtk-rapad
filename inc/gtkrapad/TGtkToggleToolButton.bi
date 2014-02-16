namespace GtkRapad

type TGtkToggleToolButton
    declare constructor
    declare constructor( byref stock_id as string )

    declare property active() as gboolean
    declare property active( byval t as gboolean )

    DECLARE_TOOL_BUTTON_COMMON()
    DECLARE_TOOL_ITEM_COMMON()
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
