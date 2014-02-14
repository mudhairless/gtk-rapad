namespace GtkRapad

type TGtkDrawingArea

    declare constructor
    declare sub setSize( byval w as integer, byval h as integer )

    declare operator cast() as GtkWidget ptr

    declare function raw() as GdkWindow ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
