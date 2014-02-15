namespace GtkRapad

type TGtkTextTag
    declare constructor( byref n as string )

    declare property priority() as integer
    declare property priority( byval p as integer )

    declare operator cast() as GtkTextTag ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
