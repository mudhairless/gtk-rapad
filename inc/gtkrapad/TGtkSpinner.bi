namespace GtkRapad

type TGtkSpinner

    declare constructor()

    declare sub start()
    declare sub stop()

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
