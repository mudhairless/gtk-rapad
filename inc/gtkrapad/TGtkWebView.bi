namespace GtkRapad

type TGtkWebView
    declare constructor
    declare operator cast() as GtkWidget ptr

    declare property uri() as string
    declare property uri( byref as string )

    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
