namespace GtkRapad

type TGtkCheckMenuItem

    declare constructor

    declare property active() as gboolean
    declare property active( byval t as gboolean )

    declare property drawAsRadio() as gboolean
    declare property drawAsRadio( byval t as gboolean )

    DECLARE_MENU_ITEM_COMMON()

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
