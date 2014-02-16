namespace GtkRapad

type TGtkRadioToolButton

    declare constructor
    declare constructor( byref stock_id as string )
    declare constructor( byref g as TGtkRadioToolButton )
    declare constructor( byval g as TGtkRadioToolButton, byref stock_id as string )

    declare property group() as GSList ptr
    declare property group( byval g as GSList ptr )

    DECLARE_COMMON_FUNCS()
    DECLARE_TOOL_ITEM_COMMON()
    DECLARE_TOOL_BUTTON_COMMON()
    COMMON_MEMBERS()
end type

end namespace
