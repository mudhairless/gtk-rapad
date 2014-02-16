namespace GtkRapad

type TGtkImageMenuItem
    declare constructor( byref lbl as string = "" )

    declare property image() as GtkWidget ptr
    declare property image( byval i as GtkWidget ptr )

    declare property alwaysShowImage() as gboolean
    declare property alwaysShowImage( byval t as gboolean )

    DECLARE_MENU_ITEM_COMMON()

    declare operator cast() as GtkWidget ptr

    DECLARE_COMMON_FUNCS()

    COMMON_MEMBERS()
end type

end namespace
