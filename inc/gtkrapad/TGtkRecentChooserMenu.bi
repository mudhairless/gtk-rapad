namespace GtkRapad

type TGtkRecentChooserMenu

    declare constructor
    declare operator cast() as GtkWidget ptr

    declare property showNumbers() as gboolean
    declare property showNumbers( byval t as gboolean )

    DECLARE_COMMON_FUNCS()
    DECLARE_RECENT_CHOOSER_COMMON()
    COMMON_MEMBERS()
end type

end namespace
