namespace GtkRapad

type TGtkRadioMenuItem

    declare constructor

    declare property group() as GSList ptr
    declare property group( byval g as GSList ptr )

    declare property active() as gboolean
    declare property active( byval t as gboolean )

    DECLARE_MENU_ITEM_COMMON()

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()

    private:
    as GSList ptr _group
end type

end namespace
