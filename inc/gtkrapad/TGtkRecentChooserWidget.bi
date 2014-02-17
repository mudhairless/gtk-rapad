namespace GtkRapad

type TGtkRecentChooserWidget
    declare constructor
    declare operator cast() as GtkWidget ptr

    DECLARE_RECENT_CHOOSER_COMMON()
    DECLARE_COMMON_FUNCS()
    COMMON_MEMBERS()
end type

end namespace
